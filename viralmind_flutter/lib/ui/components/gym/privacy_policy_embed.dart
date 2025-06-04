import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  final bool Function() privacyAccepted;
  final Widget privacyPolicyContent;

  const PrivacyPolicyWidget({
    super.key,
    required this.privacyAccepted,
    required this.privacyPolicyContent,
  });

  @override
  Widget build(BuildContext context) {
    if (privacyAccepted()) {
      return GestureDetector(
        onTap: () {
          // Ouvre la politique de confidentialité dans le navigateur
          // Pour cela, utiliser url_launcher package par exemple
          launchUrl(
            Uri.parse(
              'https://github.com/viralmind-ai/desktop/blob/main/PRIVACY.md',
            ),
          );
        },
        child: Text(
          'View Privacy Policy',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    } else {
      return Container(
        // On peut mapper className à des styles spécifiques si besoin
        child: privacyPolicyContent,
      );
    }
  }
}
