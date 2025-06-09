import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/frb_generated/api/tools.dart';
import 'package:viralmind_flutter/providers/tools_provider.dart';
import 'package:viralmind_flutter/ui/components/layout_background.dart';
import 'package:viralmind_flutter/ui/widgets/modals/init_tools_failed_modal.dart';

class MainLayout extends ConsumerStatefulWidget {
  const MainLayout({
    super.key,
    required this.child,
    required this.currentRoute,
  });
  final Widget child;
  final String currentRoute;

  @override
  ConsumerState<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  Timer? _timer;
  List<String> _initErrors = [];

  @override
  void initState() {
    super.initState();
    _initializeTools();
  }

  Future<void> _initializeTools() async {
    final errors = await initTools();
    if (errors.isNotEmpty && mounted) {
      setState(() {
        _initErrors = errors;
      });
      _showErrorModal();
    }

    await _checkToolsStatus();

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _checkToolsStatus();
    });
  }

  Future<void> _checkToolsStatus() async {
    try {
      final status = checkToolsStatus();

      const totalTools = 4;
      var initializedTools = 0;
      if (status.ffmpeg) initializedTools++;
      if (status.ffprobe) initializedTools++;
      if (status.dumpTree) initializedTools++;
      if (status.pipeline) initializedTools++;

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
      print('Failed to check tools status: $error');
      _timer?.cancel();
    }
  }

  void _showErrorModal() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => InitToolsFailedModal(
            errors: _initErrors,
            retry: () {
              Navigator.of(context).pop();
              _initializeTools();
            },
          ),
        );
      }
    });
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
        currentRoute: widget.currentRoute,
        child: widget.child,
      ),
    );
  }
}
