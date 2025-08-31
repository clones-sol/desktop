import 'dart:ui';

import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/ui/components/upload_button.dart';
import 'package:clones_desktop/ui/components/wallet_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Persistent floating rail for global actions like Uploads and Wallet.
///
/// UX goals:
/// - Glass/liquid look (blur + translucent background + subtle inner border)
/// - Always accessible, floats above content, but under modals
/// - Keyboard focusable and minimum 48px tap targets
class GlobalActionRail extends ConsumerStatefulWidget {
  const GlobalActionRail({super.key});

  @override
  ConsumerState<GlobalActionRail> createState() => _GlobalActionRailState();
}

class _GlobalActionRailState extends ConsumerState<GlobalActionRail> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final disableAnimations = mediaQuery.disableAnimations;

    final isConnected =
        ref.watch(sessionNotifierProvider.select((s) => s.isConnected));

    const double railPaddingVertical = 10;
    const double railPaddingHorizontal = 50;
    const double railRadius = 42;
    const double spacing = 20;

    final borderColor = Colors.white.withValues(alpha: 0.08);
    final backgroundColor = Colors.white.withValues(alpha: 0.08);
    final shadowColor = Colors.black.withValues(alpha: 0.25);

    final rail = ClipRRect(
      borderRadius: BorderRadius.circular(railRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(railRadius),
            border: Border.all(color: borderColor, width: 0.5),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 30,
                offset: const Offset(0, 8),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withValues(alpha: 0.10),
                Colors.white.withValues(alpha: 0.06),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: railPaddingHorizontal,
              vertical: railPaddingVertical,
            ),
            child: FocusTraversalGroup(
              policy: OrderedTraversalPolicy(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WalletButton(),
                  if (isConnected) ...[
                    const SizedBox(width: spacing),
                    const UploadButton(),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );

    final interactiveRail = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: rail,
    );

    if (disableAnimations) {
      return Opacity(
        opacity: _isHovered ? 1.0 : 0.1,
        child: interactiveRail,
      );
    }

    return AnimatedOpacity(
      opacity: isConnected == false || _isHovered ? 1.0 : 0.1,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      child: interactiveRail,
    );
  }
}
