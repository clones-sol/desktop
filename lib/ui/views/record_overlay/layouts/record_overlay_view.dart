import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/views/record_overlay/bloc/provider.dart';
import 'package:clones_desktop/ui/views/record_overlay/layouts/components/record_overlay_header.dart';
import 'package:clones_desktop/ui/views/record_overlay/layouts/components/record_overlay_objectives.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordOverlayView extends ConsumerWidget {
  const RecordOverlayView({super.key, required this.windowController});
  final WindowController windowController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme.copyWith(
          bodySmall: TextStyle(color: VMColors.secondaryText),
          bodyMedium: TextStyle(color: VMColors.secondaryText),
          bodyLarge: TextStyle(color: VMColors.secondaryText),
          titleLarge: const TextStyle(color: VMColors.primaryText),
          titleMedium: const TextStyle(color: VMColors.primaryText),
          titleSmall: const TextStyle(color: VMColors.primaryText),
        );

    final mediaQuery = MediaQuery.of(context);

    return MaterialApp(
      title: 'Clones Desktop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFbb4eff)),
        textTheme: textTheme,
        snackBarTheme: SnackBarThemeData(
          width: mediaQuery.size.width * 0.5,
          backgroundColor: VMColors.tertiary.withValues(alpha: 0.7),
          elevation: 2,
          contentTextStyle: textTheme.bodyMedium,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: VMColors.tertiary),
          ),
          closeIconColor: VMColors.primaryText,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onPanStart: (details) {
          final recordOverlay = ref.read(recordOverlayNotifierProvider);
          if (!recordOverlay.isLocked) {
            // This requires a window manager to start dragging.
            // ref.read(tauriApiClientProvider).startDragging();
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: mediaQuery.size.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [RecordOverlayHeader(), RecordOverlayObjectives()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
