import 'package:equatable/equatable.dart';
import 'package:betterme_quiz/features/quiz/domain/entities/quiz_entity.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final QuizEntity quiz;
  final int currentQuestionIndex;
  final Map<String, List<String>> userAnswers;

  const QuizLoaded({
    required this.quiz,
    this.currentQuestionIndex = 0,
    this.userAnswers = const {},
  });

  QuizLoaded copyWith({
    QuizEntity? quiz,
    int? currentQuestionIndex,
    Map<String, List<String>>? userAnswers,
  }) {
    return QuizLoaded(
      quiz: quiz ?? this.quiz,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      userAnswers: userAnswers ?? this.userAnswers,
    );
  }

  @override
  List<Object> get props => [quiz, currentQuestionIndex, userAnswers];
}

class QuizError extends QuizState {
  final String message;

  const QuizError({required this.message});

  @override
  List<Object> get props => [message];
}

class QuizSubmissionSuccess extends QuizState {}
