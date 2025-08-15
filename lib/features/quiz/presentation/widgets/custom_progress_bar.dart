import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final Color activeColor;
  final Color inactiveColor;
  final int numberOfSegments; // Visual segments, not necessarily totalSteps

  const CustomProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
    this.numberOfSegments = 6, // As per requirement
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double totalSpaceWidth = (numberOfSegments - 1) * 4.0;
        final double segmentWidth =
            (constraints.maxWidth - totalSpaceWidth) / numberOfSegments;

        final double overallProgress = totalSteps > 0
            ? currentStep / totalSteps
            : 0.0;
        final double filledSegments = overallProgress * numberOfSegments;

        return Row(
          children: List.generate(numberOfSegments, (index) {
            double segmentFill = 0.0;
            if (filledSegments >= index + 1) {
              segmentFill = 1.0; // Fully filled
            } else if (filledSegments > index) {
              segmentFill = filledSegments - index; // Partially filled
            }

            return Row(
              children: [
                Container(
                  width: segmentWidth,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: inactiveColor, // Base color is inactive
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: segmentFill,
                    child: Container(
                      decoration: BoxDecoration(
                        color: activeColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ),
                if (index < numberOfSegments - 1)
                  const SizedBox(width: 4.0), // Space between segments
              ],
            );
          }),
        );
      },
    );
  }
}
