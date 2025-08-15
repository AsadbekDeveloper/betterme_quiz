import 'package:dartz/dartz.dart';
import 'package:betterme_quiz/core/errors/exceptions.dart';
import 'package:betterme_quiz/core/errors/failures.dart';
import 'package:betterme_quiz/features/quiz/data/datasources/quiz_local_data_source.dart';
import 'package:betterme_quiz/features/quiz/data/models/quiz.dart';
import 'package:betterme_quiz/features/quiz/domain/entities/quiz_entity.dart';
import 'package:betterme_quiz/features/quiz/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizLocalDataSource localDataSource;

  QuizRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, QuizEntity>> getQuiz(String locale) async {
    try {
      final QuizModel quizModel = await localDataSource.loadQuiz(locale);
      return Right(quizModel);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
