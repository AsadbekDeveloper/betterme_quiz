import 'package:dartz/dartz.dart';
import 'package:betterme_quiz/core/errors/failures.dart';

class SubmitAnswer {
  Future<Either<Failure, void>> call(String questionId, List<String> selectedOptionIds) async {
    // For now, this is a placeholder. In a real application, this would
    // interact with a repository to save the answers.
    return const Right(null);
  }
}
