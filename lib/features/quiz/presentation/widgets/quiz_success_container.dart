import 'package:flutter/material.dart';
import 'package:betterme_quiz/features/quiz/presentation/widgets/promo_code_section.dart';
import 'package:betterme_quiz/features/quiz/presentation/widgets/plan_card.dart';
import 'package:betterme_quiz/features/quiz/presentation/widgets/disclaimer_text.dart';

class QuizSuccessContainer extends StatefulWidget {
  const QuizSuccessContainer({super.key});

  @override
  State<QuizSuccessContainer> createState() => _QuizSuccessContainerState();
}

class _QuizSuccessContainerState extends State<QuizSuccessContainer> {
  int _selectedPlanIndex = 1; // Default to the "Most Popular" plan

  List<Widget> _buildPlanCards(BuildContext context, bool isRow) {
    final List<Map<String, dynamic>> plans = [
      {
        'title': '1-Week Trial',
        'planDuration': '4-WEEK PLAN',
        'originalPrice': '79.99',
        'discountedPrice': '39.99',
        'pricePerDay': '5.71',
        'isPopular': false,
      },
      {
        'title': '4-Week Plan',
        'planDuration': '4-WEEK PLAN',
        'originalPrice': '179.99',
        'discountedPrice': '89.99',
        'pricePerDay': '3.21',
        'isPopular': true,
      },
      {
        'title': '12-Week Plan',
        'planDuration': '4-WEEK PLAN',
        'originalPrice': '399.99',
        'discountedPrice': '199.99',
        'pricePerDay': '2.38',
        'isPopular': false,
      },
    ];

    return List.generate(plans.length, (index) {
      final plan = plans[index];
      Widget planCardWidget = Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isRow ? 5.0 : 0.0,
          vertical: isRow ? 0.0 : 5.0,
        ),
        child: PlanCard(
          title: plan['title'],
          planDuration: plan['planDuration'],
          originalPrice: plan['originalPrice'],
          discountedPrice: plan['discountedPrice'],
          pricePerDay: plan['pricePerDay'],
          isPopular: plan['isPopular'],
          isSelected: _selectedPlanIndex == index,
          onTap: () {
            setState(() {
              _selectedPlanIndex = index;
            });
          },
        ),
      );

      if (isRow) {
        return Expanded(child: planCardWidget);
      } else {
        return AspectRatio(
          aspectRatio: 1.0, // Adjust this ratio as needed for the desired card shape in column layout
          child: planCardWidget,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              'Choose Your Plan',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const PromoCodeSection(),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _buildPlanCards(context, true),
                  );
                } else {
                  return Column(children: _buildPlanCards(context, false));
                }
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Handle "GET MY PLAN" button press
                // You can access the selected plan using _selectedPlanIndex
                print('Selected Plan Index: $_selectedPlanIndex');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'GET MY PLAN',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 30),
            const DisclaimerText(),
          ],
        ),
      ),
    );
  }
}
