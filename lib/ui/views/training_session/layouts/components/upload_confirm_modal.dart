import 'package:clones_desktop/application/tauri_api.dart';
import 'package:clones_desktop/application/upload/provider.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/components/design_widget/dialog/popup_template.dart';
import 'package:clones_desktop/utils/env.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadConfirmModal extends ConsumerWidget {
  const UploadConfirmModal({
    super.key,
    required this.onConfirm,
  });

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return PopupTemplate(
      popupTitle: 'Confirm Upload',
      popupContent: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              style: theme.textTheme.bodyMedium,
              children: [
                const TextSpan(
                  text:
                      "Before uploading your recording, make sure you've read the ",
                ),
                TextSpan(
                  text: 'Privacy Policy.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: ClonesColors.secondary,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      try {
                        await ref
                            .read(tauriApiClientProvider)
                            .openExternalUrl(Env.privacyPolicyUrl);
                      } catch (e) {
                        debugPrint('Failed to open external URL: $e');
                      }
                    },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'By uploading your recording data, you give clones permission to process and train AI agents with it.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: BtnPrimary(
                  buttonText: 'Cancel',
                  widthExpanded: true,
                  onTap: () {
                    ref
                        .read(uploadQueueProvider.notifier)
                        .setUploadDataAllowed(false);
                    Navigator.of(context).pop();
                  },
                  btnPrimaryType: BtnPrimaryType.outlinePrimary,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: BtnPrimary(
                  buttonText: 'Confirm',
                  widthExpanded: true,
                  onTap: () {
                    ref
                        .read(uploadQueueProvider.notifier)
                        .setUploadDataAllowed(true);
                    Navigator.of(context).pop();
                    onConfirm();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      displayCloseButton: false,
    );
  }
}
