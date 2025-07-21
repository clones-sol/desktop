import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/components/design_widget/dialog/popup_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppDialogs {
  static Future showConfirmDialog(
    BuildContext context,
    WidgetRef ref,
    String title,
    String content,
    String buttonText,
    Function onPressed, {
    String? cancelText,
    Function? cancelAction,
    TextStyle? titleStyle,
    String? additionalContent,
    TextStyle? additionalContentStyle,
  }) async {
    cancelText ??= 'Cancel';
    await showDialog(
      barrierDismissible: false,
      useRootNavigator: false,
      context: context,
      builder: (BuildContext context) {
        final theme = Theme.of(context);
        return PopupTemplate(
          popupContent: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text.rich(
                TextSpan(
                  text: '',
                  style: theme.textTheme.bodySmall,
                  children: <InlineSpan>[
                    TextSpan(
                      text: content,
                      style: theme.textTheme.bodySmall,
                    ),
                    if (additionalContent != null)
                      TextSpan(
                        text: '\n\n$additionalContent',
                        style:
                            additionalContentStyle ?? theme.textTheme.bodySmall,
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: BtnPrimary(
                      buttonText: 'No',
                      btnPrimaryType: BtnPrimaryType.outlinePrimary,
                      key: const Key('cancelButton'),
                      onTap: () {
                        context.pop();
                        if (cancelAction != null) {
                          cancelAction();
                        }
                      },
                      widthExpanded: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: BtnPrimary(
                      buttonText: 'Yes',
                      key: const Key('yesButton'),
                      onTap: () async {
                        context.pop();
                        onPressed();
                      },
                      widthExpanded: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
          popupTitle: title,
          displayCloseButton: false,
        );
      },
    );
  }

  static Future showInfoDialog(
    BuildContext context,
    WidgetRef ref,
    String title,
    String content, {
    String? buttonLabel,
    Function? onPressed,
  }) async {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    await showDialog(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) {
        buttonLabel = buttonLabel ?? 'OK';
        return PopupTemplate(
          popupContent: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                content,
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(
                width: mediaQuery.size.width,
                height: 20,
              ),
              BtnPrimary(
                buttonText: buttonLabel!,
                key: const Key('yesButton'),
                onTap: () {
                  onPressed?.call();
                  context.pop();
                },
              ),
            ],
          ),
          popupTitle: title,
        );
      },
    );
  }
}
