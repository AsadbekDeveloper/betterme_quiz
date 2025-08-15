import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:betterme_quiz/features/quiz/data/models/quiz.dart';
import 'package:betterme_quiz/core/errors/exceptions.dart';

abstract class QuizLocalDataSource {
  Future<QuizModel> loadQuiz();
}

class QuizLocalDataSourceImpl implements QuizLocalDataSource {
  @override
  Future<QuizModel> loadQuiz() async {
    try {
      final String response = await rootBundle.loadString('assets/quiz_en.json');
      final List<dynamic> data = json.decode(response);
      return QuizModel.fromJson(data);
    } catch (e) {
      throw CacheException();
    }
  }
}
