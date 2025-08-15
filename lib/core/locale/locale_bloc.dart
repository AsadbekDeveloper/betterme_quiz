import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:betterme_quiz/core/locale/locale_event.dart';
import 'package:betterme_quiz/core/locale/locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const LocaleState(Locale('en'))) {
    on<LocaleChanged>((event, emit) {
      emit(LocaleState(event.locale));
    });
  }
}
