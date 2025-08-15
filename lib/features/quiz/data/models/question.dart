import 'package:betterme_quiz/features/quiz/data/models/option.dart';
import 'package:betterme_quiz/features/quiz/data/models/question_type.dart';
import 'package:betterme_quiz/features/quiz/domain/entities/quiz_entity.dart';

class Question extends QuestionEntity {
  const Question({
    required super.id,
    required super.question,
    required super.type,
    required super.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as String,
      question: json['question'] as String,
      type: QuestionType.fromString(json['type'] as String).toStringValue(),
      options: (json['options'] as List)
          .map((option) => Option.fromJson(option as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'type': type,
      'options': options.map((option) => (option as Option).toJson()).toList(),
    };
  }
}
