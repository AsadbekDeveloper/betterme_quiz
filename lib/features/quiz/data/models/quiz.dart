import 'package:betterme_quiz/features/quiz/data/models/question.dart';
import 'package:betterme_quiz/features/quiz/domain/entities/quiz_entity.dart';

class QuizModel extends QuizEntity {
  const QuizModel({required super.questions});

  factory QuizModel.fromJson(List<dynamic> jsonList) {
    return QuizModel(
      questions: jsonList
          .map((q) => Question.fromJson(q as Map<String, dynamic>))
          .toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return questions.map((q) => (q as Question).toJson()).toList();
  }
}
