import 'package:get_it/get_it.dart';
import 'package:betterme_quiz/features/quiz/data/datasources/quiz_local_data_source.dart';
import 'package:betterme_quiz/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:betterme_quiz/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:betterme_quiz/features/quiz/domain/usecases/load_quiz.dart';
import 'package:betterme_quiz/features/quiz/domain/usecases/submit_answer.dart';
import 'package:betterme_quiz/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:betterme_quiz/core/locale/locale_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Bloc
  sl.registerFactory(
    () => QuizBloc(
      loadQuiz: sl(),
      submitAnswer: sl(),
    ),
  );
  sl.registerFactory(
    () => LocaleBloc(),
  );

  // Use cases
  sl.registerLazySingleton(() => LoadQuiz(sl()));
  sl.registerLazySingleton(() => SubmitAnswer());

  // Repository
  sl.registerLazySingleton<QuizRepository>(
    () => QuizRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<QuizLocalDataSource>(
    () => QuizLocalDataSourceImpl(),
  );
}
