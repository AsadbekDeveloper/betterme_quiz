import 'package:equatable/equatable.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class LoadQuizEvent extends QuizEvent {}

class AnswerQuestionEvent extends QuizEvent {
  final String questionId;
  final List<String> selectedOptionIds;

  const AnswerQuestionEvent({
    required this.questionId,
    required this.selectedOptionIds,
  });

  @override
  List<Object> get props => [questionId, selectedOptionIds];
}

class GoToPreviousQuestionEvent extends QuizEvent {}

class UpdateMultipleChoiceSelectionEvent extends QuizEvent {
  final String questionId;
  final List<String> selectedOptionIds;

  const UpdateMultipleChoiceSelectionEvent({
    required this.questionId,
    required this.selectedOptionIds,
  });

  @override
  List<Object> get props => [questionId, selectedOptionIds];
}

class GoToNextQuestionEvent extends QuizEvent {}
