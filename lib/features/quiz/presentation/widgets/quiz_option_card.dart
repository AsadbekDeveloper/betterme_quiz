import 'package:flutter/material.dart';
import 'package:betterme_quiz/features/quiz/data/models/question_type.dart';

class QuizOptionCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final QuestionType questionType;

  const QuizOptionCard({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.questionType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey.shade300,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.black : Colors.black87,
                ),
              ),
            ),
            questionType == QuestionType.multiple
                ? Checkbox(
                    value: isSelected,
                    onChanged: (value) => onTap(),
                    activeColor: Colors.black,
                  )
                : Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.black : Colors.grey,
                        width: 2,
                      ),
                      color: Colors.transparent,
                    ),
                    child: isSelected
                        ? Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 8,
                            ),
                          )
                        : null,
                  ),
          ],
        ),
      ),
    );
  }
}
