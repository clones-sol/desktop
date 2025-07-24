import 'package:clones_desktop/ui/views/record_overlay/bloc/provider.dart';
import 'package:clones_desktop/ui/views/record_overlay/layouts/components/record_overlay_header.dart';
import 'package:clones_desktop/ui/views/record_overlay/layouts/components/record_overlay_objectives.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

class RecordOverlayView extends ConsumerStatefulWidget {
  const RecordOverlayView({super.key});

  static const routeName = '/record-overlay';

  @override
  ConsumerState<RecordOverlayView> createState() => _RecordOverlayViewState();
}

class _RecordOverlayViewState extends ConsumerState<RecordOverlayView>
    with WindowListener {
  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowFocus() {
    ref.read(recordOverlayNotifierProvider.notifier).setFocused(true);
  }

  @override
  void onWindowBlur() {
    ref.read(recordOverlayNotifierProvider.notifier).setFocused(false);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      width: mediaQuery.size.width,
      height: mediaQuery.size.height,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
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
    );
  }
}
