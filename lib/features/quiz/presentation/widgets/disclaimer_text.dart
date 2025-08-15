import 'package:flutter/material.dart';
import 'package:betterme_quiz/l10n/app_localizations.dart';

class DisclaimerText extends StatelessWidget {
  const DisclaimerText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
        children: [
          TextSpan(
            text: AppLocalizations.of(context)!.disclaimerPart1,
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.disclaimerPrice('179.99'),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.disclaimerPart2,
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.disclaimerDuration('4 weeks'),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.disclaimerPart3,
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.disclaimerWebsite,
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.disclaimerPart4,
          ),
        ],
      ),
    );
  }
}
