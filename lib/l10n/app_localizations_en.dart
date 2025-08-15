// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get menu => 'Menu';

  @override
  String get next => 'Next';

  @override
  String get quiz => 'Quiz';

  @override
  String get quizCompleted => 'Quiz Completed!';

  @override
  String get errorPrefix => 'Error: ';

  @override
  String get welcomeToQuiz => 'Welcome to the Quiz!';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageRussian => 'Русский';

  @override
  String get disclaimerPart1 =>
      'Without cancellation, before the selected discounted intro plan ends, I accept that BetterMe will automatically charge ';

  @override
  String disclaimerPrice(Object price) {
    return '$price';
  }

  @override
  String get disclaimerPart2 => ' every ';

  @override
  String disclaimerDuration(Object duration) {
    return '$duration';
  }

  @override
  String get disclaimerPart3 =>
      ' until I cancel. Cancel online via the account page on the ';

  @override
  String get disclaimerWebsite => 'website';

  @override
  String get disclaimerPart4 => ' or app.';

  @override
  String get mostPopular => 'MOST POPULAR';

  @override
  String get perDay => 'per day';

  @override
  String get promoCodeApplied => 'Your promo code is applied!';

  @override
  String get promoCodeValue => 'willora_aug25';

  @override
  String get minutesSeconds => 'minutes seconds';

  @override
  String get chooseYourPlan => 'Choose Your Plan';

  @override
  String get plan1WeekTrial => '1-Week Trial';

  @override
  String get plan4WeekPlan => '4-Week Plan';

  @override
  String get plan12WeekPlan => '12-Week Plan';

  @override
  String get getMyApp => 'GET MY PLAN';
}
