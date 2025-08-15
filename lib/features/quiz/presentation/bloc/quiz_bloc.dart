import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:betterme_quiz/core/errors/failures.dart';
import 'package:betterme_quiz/features/quiz/domain/usecases/load_quiz.dart';
import 'package:betterme_quiz/features/quiz/domain/usecases/submit_answer.dart';
import 'package:betterme_quiz/features/quiz/presentation/bloc/quiz_event.dart';
import 'package:betterme_quiz/features/quiz/presentation/bloc/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final LoadQuiz loadQuiz;
  final SubmitAnswer submitAnswer;

  QuizBloc({required this.loadQuiz, required this.submitAnswer})
    : super(QuizInitial()) {
    on<LoadQuizEvent>(_onLoadQuiz);
    on<AnswerQuestionEvent>(_onAnswerQuestion);
    on<GoToPreviousQuestionEvent>(_onGoToPreviousQuestion);
    on<UpdateMultipleChoiceSelectionEvent>(_onUpdateMultipleChoiceSelection);
    on<GoToNextQuestionEvent>(_onGoToNextQuestion); // Add this line
  }

  Future<void> _onLoadQuiz(LoadQuizEvent event, Emitter<QuizState> emit) async {
    emit(QuizLoading());
    final failureOrQuiz = await loadQuiz();
    failureOrQuiz.fold(
      (failure) => emit(QuizError(message: _mapFailureToMessage(failure))),
      (quiz) => emit(QuizLoaded(quiz: quiz)),
    );
  }

  Future<void> _onAnswerQuestion(
    AnswerQuestionEvent event,
    Emitter<QuizState> emit,
  ) async {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      // For single choice, update answer and advance
      final updatedAnswers = Map<String, List<String>>.from(
        currentState.userAnswers,
      );
      updatedAnswers[event.questionId] = event.selectedOptionIds;

      final isLastQuestion =
          currentState.currentQuestionIndex ==
          currentState.quiz.questions.length - 1;

      emit(currentState.copyWith(userAnswers: updatedAnswers)); // Only update answers here

      if (isLastQuestion) {
        emit(QuizSubmissionSuccess()); // Submit if it's the last question
      }
    }
  }

  Future<void> _onUpdateMultipleChoiceSelection(
    UpdateMultipleChoiceSelectionEvent event,
    Emitter<QuizState> emit,
  ) async {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      final updatedAnswers = Map<String, List<String>>.from(
        currentState.userAnswers,
      );
      updatedAnswers[event.questionId] = event.selectedOptionIds;

      emit(currentState.copyWith(userAnswers: updatedAnswers));
    }
  }

  Future<void> _onGoToPreviousQuestion(
    GoToPreviousQuestionEvent event,
    Emitter<QuizState> emit,
  ) async {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      if (currentState.currentQuestionIndex > 0) {
        emit(
          currentState.copyWith(
            currentQuestionIndex: currentState.currentQuestionIndex - 1,
          ),
        );
      } else {
        // If on the first question, perhaps navigate back from the quiz page
        // For bloc, we just stay on the first question or transition to initial if needed
        emit(
          QuizInitial(),
        ); // Or keep current state if you don't want to go back to initial
      }
    }
  }

  Future<void> _onGoToNextQuestion(
    GoToNextQuestionEvent event,
    Emitter<QuizState> emit,
  ) async {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      final isLastQuestion =
          currentState.currentQuestionIndex ==
          currentState.quiz.questions.length - 1;

      if (!isLastQuestion) {
        emit(
          currentState.copyWith(
            currentQuestionIndex: currentState.currentQuestionIndex + 1,
          ),
        );
      } else {
        // If it's the last question, we might want to submit or do nothing
        // For now, we'll just stay on the last question if already there.
        // The QuizSubmissionSuccess is handled by _onAnswerQuestion for the last question.
      }
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Error';
      case CacheFailure:
        return 'Cache Error';
      default:
        return 'Unexpected Error';
    }
  }
}
