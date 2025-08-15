import 'package:betterme_quiz/features/quiz/domain/entities/quiz_entity.dart';

class Option extends OptionEntity {
  const Option({
    required super.id,
    required super.text,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(id: json['id'] as String, text: json['text'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text};
  }
}
