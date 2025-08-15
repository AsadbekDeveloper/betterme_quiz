import 'package:dartz/dartz.dart';
import 'package:betterme_quiz/core/errors/failures.dart';
import 'package:betterme_quiz/features/quiz/domain/entities/quiz_entity.dart';
import 'package:betterme_quiz/features/quiz/domain/repositories/quiz_repository.dart';

class LoadQuiz {
  final QuizRepository repository;

  LoadQuiz(this.repository);

  Future<Either<Failure, QuizEntity>> call(String locale) async {
    return await repository.getQuiz(locale);
  }
}
