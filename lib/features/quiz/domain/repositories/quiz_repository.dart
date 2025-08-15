import 'package:dartz/dartz.dart';
import 'package:betterme_quiz/core/errors/failures.dart';
import 'package:betterme_quiz/features/quiz/domain/entities/quiz_entity.dart';

abstract class QuizRepository {
  Future<Either<Failure, QuizEntity>> getQuiz();
}
