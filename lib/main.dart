import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:betterme_quiz/features/quiz/presentation/pages/quiz.dart';
import 'package:betterme_quiz/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:betterme_quiz/injection_container.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<QuizBloc>(),
      child: MaterialApp(
        title: 'BetterMe Quiz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: QuizPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
