import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/application/upload/provider.dart';
import 'package:clones_desktop/application/upload/state.dart';
import 'package:clones_desktop/application/upload_modal_provider.dart';
import 'package:clones_desktop/application/wallet_modal_provider.dart';
import 'package:clones_desktop/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadButton extends ConsumerStatefulWidget {
  const UploadButton({
    super.key,
  });

  @override
  ConsumerState<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends ConsumerState<UploadButton> {
  @override
  Widget build(BuildContext context) {
    final isConnected =
        ref.watch(sessionNotifierProvider.select((s) => s.isConnected));

    if (isConnected) {
      Color badgeColor;
      final queueItems = ref.watch(uploadQueueProvider).values.toList();
      if (queueItems.any((item) => item.uploadStatus == UploadStatus.error)) {
        badgeColor = Colors.red[500]!;
      } else {
        if (queueItems.any(
          (item) =>
              item.uploadStatus == UploadStatus.uploading ||
              item.uploadStatus == UploadStatus.processing ||
              item.uploadStatus == UploadStatus.zipping,
        )) {
          badgeColor = Colors.yellow[500]!;
        } else {
          if (queueItems.every(
            (item) => item.uploadStatus == UploadStatus.done,
          )) {
            badgeColor = Colors.green[500]!;
          } else {
            badgeColor = Theme.of(
              context,
            ).colorScheme.secondary;
          }
        }
      }

      return InkWell(
        onTap: () {
          ref.read(walletModalProvider.notifier).hide();
          ref.read(uploadModalProvider.notifier).show();
        },
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    ClonesColors.primary.withValues(alpha: 0.5),
                    ClonesColors.secondary.withValues(alpha: 0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                Assets.uploadIcon,
                width: 50,
                height: 50,
              ),
            ),
            if (queueItems.isNotEmpty)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: badgeColor.withValues(alpha: 0.7),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
