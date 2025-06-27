import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/tauri_api.dart';
import 'package:viralmind_flutter/application/tools_provider.dart';
import 'package:viralmind_flutter/ui/components/layout_background.dart';

class MainLayout extends ConsumerStatefulWidget {
  const MainLayout({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  ConsumerState<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initializeTools();
  }

  Future<void> _initializeTools() async {
    final tauriApiClient = ref.read(tauriApiClientProvider);
    await tauriApiClient.initTools();

    await _checkToolsStatus();

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _checkToolsStatus();
    });
  }

  Future<void> _checkToolsStatus() async {
    try {
      final tauriApiClient = ref.read(tauriApiClientProvider);
      final status = await tauriApiClient.checkTools();

      const totalTools = 4;
      var initializedTools = 0;
      if (status['ffmpeg'] ?? false) initializedTools++;
      if (status['ffprobe'] ?? false) initializedTools++;
      if (status['dump_tree'] ?? false) initializedTools++;
      if (status['pipeline'] ?? false) initializedTools++;

      final progress = (initializedTools / totalTools) * 100;

      ref
          .read(toolsInitProvider.notifier)
          .setProgress(progress > 0 ? progress : 5.0);

      if (initializedTools == totalTools) {
        _timer?.cancel();
        _timer = null;

        ref.read(toolsInitProvider.notifier).setProgress(100);

        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            ref.read(toolsInitProvider.notifier).setInitializing(false);
          }
        });
      } else {
        if (mounted) {
          ref.read(toolsInitProvider.notifier).setInitializing(true);
        }
      }
    } catch (error) {
      debugPrint('Failed to check tools status: $error');
      _timer?.cancel();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBackground(
        child: widget.child,
      ),
    );
  }
}
