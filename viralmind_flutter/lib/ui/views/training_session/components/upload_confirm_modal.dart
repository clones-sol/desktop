import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viralmind_flutter/application/upload/provider.dart';
import 'package:viralmind_flutter/ui/components/buttons/btn_primary.dart';
import 'package:viralmind_flutter/utils/env.dart';

class UploadConfirmModal extends ConsumerWidget {
  const UploadConfirmModal({
    super.key,
    required this.onConfirm,
  });

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Confirm Upload'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  const TextSpan(
                    text:
                        "Before uploading your recording, make sure you've read the ",
                  ),
                  TextSpan(
                    text: 'Privacy Policy.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(Uri.parse(Env.privacyPolicyUrl));
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'By uploading your recording data, you give Viralmind permission to process and train AI agents with it.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        BtnPrimary(
          buttonText: 'Cancel',
          onTap: () {
            ref.read(uploadQueueProvider.notifier).setUploadDataAllowed(false);
            Navigator.of(context).pop();
          },
          btnPrimaryType: BtnPrimaryType.outlinePrimary,
        ),
        BtnPrimary(
          buttonText: 'Confirm',
          onTap: () {
            ref.read(uploadQueueProvider.notifier).setUploadDataAllowed(true);
            Navigator.of(context).pop();
            onConfirm();
          },
        ),
      ],
    );
  }
}
