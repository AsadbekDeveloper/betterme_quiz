enum QuestionType {
  single,
  multiple,
  scale,
  input;

  factory QuestionType.fromString(String type) {
    switch (type) {
      case 'single':
        return QuestionType.single;
      case 'multiple':
        return QuestionType.multiple;
      case 'scale':
        return QuestionType.scale;
      case 'input':
        return QuestionType.input;
      default:
        throw ArgumentError('Unknown QuestionType: $type');
    }
  }

  String toStringValue() {
    switch (this) {
      case QuestionType.single:
        return 'single';
      case QuestionType.multiple:
        return 'multiple';
      case QuestionType.scale:
        return 'scale';
      case QuestionType.input:
        return 'input';
    }
  }
}
