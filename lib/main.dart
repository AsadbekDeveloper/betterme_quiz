import 'package:betterme_quiz/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:betterme_quiz/features/quiz/presentation/pages/quiz.dart';
import 'package:betterme_quiz/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:betterme_quiz/injection_container.dart' as di;
import 'package:betterme_quiz/core/locale/locale_bloc.dart';
import 'package:betterme_quiz/core/locale/locale_state.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<QuizBloc>(),
        ),
        BlocProvider(
          create: (_) => di.sl<LocaleBloc>(),
        ),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, localeState) {
          return MaterialApp(
            title: 'BetterMe Quiz',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: QuizPage(),
            debugShowCheckedModeBanner: false,
            locale: localeState.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
