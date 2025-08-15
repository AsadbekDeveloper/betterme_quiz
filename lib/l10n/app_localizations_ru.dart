// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get language => 'Русский';

  @override
  String get menu => 'Меню';

  @override
  String get next => 'Следующий';

  @override
  String get quiz => 'Викторина';

  @override
  String get quizCompleted => 'Тест завершен!';

  @override
  String get errorPrefix => 'Ошибка: ';

  @override
  String get welcomeToQuiz => 'Добро пожаловать в викторину!';

  @override
  String get languageEnglish => 'Английский';

  @override
  String get languageRussian => 'Русский';

  @override
  String get disclaimerPart1 =>
      'Без отмены, до окончания выбранного плана со скидкой, я соглашаюсь, что BetterMe будет автоматически взимать ';

  @override
  String disclaimerPrice(Object price) {
    return '$price';
  }

  @override
  String get disclaimerPart2 => ' каждые ';

  @override
  String disclaimerDuration(Object duration) {
    return '$duration';
  }

  @override
  String get disclaimerPart3 =>
      ' до тех пор, пока я не отменю. Отменить онлайн можно через страницу аккаунта на ';

  @override
  String get disclaimerWebsite => 'сайте';

  @override
  String get disclaimerPart4 => ' или в приложении.';

  @override
  String get mostPopular => 'САМЫЙ ПОПУЛЯРНЫЙ';

  @override
  String get perDay => 'в день';

  @override
  String get promoCodeApplied => 'Ваш промокод применен!';

  @override
  String get promoCodeValue => 'willora_aug25';

  @override
  String get minutesSeconds => 'минут секунд';

  @override
  String get chooseYourPlan => 'Выберите свой план';

  @override
  String get plan1WeekTrial => 'Пробная неделя';

  @override
  String get plan4WeekPlan => 'План на 4 недели';

  @override
  String get plan12WeekPlan => 'План на 12 недель';

  @override
  String get getMyApp => 'ПОЛУЧИТЬ МОЙ ПЛАН';
}
