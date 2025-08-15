import 'package:equatable/equatable.dart';

class QuizEntity extends Equatable {
  final List<QuestionEntity> questions;

  const QuizEntity({required this.questions});

  @override
  List<Object?> get props => [questions];
}

class QuestionEntity extends Equatable {
  final String id;
  final String question;
  final String type;
  final List<OptionEntity> options;

  const QuestionEntity({
    required this.id,
    required this.question,
    required this.type,
    required this.options,
  });

  @override
  List<Object?> get props => [id, question, type, options];
}

class OptionEntity extends Equatable {
  final String id;
  final String text;

  const OptionEntity({
    required this.id,
    required this.text,
  });

  @override
  List<Object?> get props => [id, text];
}
