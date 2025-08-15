import 'package:flutter/material.dart';

class DisclaimerText extends StatelessWidget {
  const DisclaimerText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
        children: const [
          TextSpan(
            text: 'Without cancellation, before the selected discounted intro plan ends, I accept that BetterMe will automatically charge ',
          ),
          TextSpan(
            text: '179.99',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' every ',
          ),
          TextSpan(
            text: '4 weeks',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' until I cancel. Cancel online via the account page on the ',
          ),
          TextSpan(
            text: 'website',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: ' or app.',
          ),
        ],
      ),
    );
  }
}
