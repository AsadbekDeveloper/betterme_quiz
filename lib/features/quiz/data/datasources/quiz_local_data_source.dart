import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:betterme_quiz/features/quiz/data/models/quiz.dart';
import 'package:betterme_quiz/core/errors/exceptions.dart';

abstract class QuizLocalDataSource {
  Future<QuizModel> loadQuiz(String locale);
}

class QuizLocalDataSourceImpl implements QuizLocalDataSource {
  @override
  Future<QuizModel> loadQuiz(String locale) async {
    try {
      final String response = await rootBundle.loadString('assets/quiz_$locale.json');
      final List<dynamic> data = json.decode(response);
      return QuizModel.fromJson(data);
    } catch (e) {
      throw CacheException();
    }
  }
}
