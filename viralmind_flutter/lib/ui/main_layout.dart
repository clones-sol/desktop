import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/frb_generated/api/tools.dart';
import 'package:viralmind_flutter/providers/tools_provider.dart';
import 'package:viralmind_flutter/ui/widgets/modals/init_tools_failed_modal.dart';
import 'package:viralmind_flutter/ui/components/sidebar.dart';

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
      int initializedTools = 0;
      if (status.ffmpeg) initializedTools++;
      if (status.ffprobe) initializedTools++;
      if (status.dumpTree) initializedTools++;
      if (status.pipeline) initializedTools++;

      final progress = (initializedTools / totalTools) * 100;

      ref
          .read(toolsInitProvider.notifier)
          .setProgress(progress > 0 ? progress.toDouble() : 5.0);

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
    final isMac = Platform.isMacOS;
    final primaryColor = Theme.of(context).primaryColor;
    final bgColor = isMac ? primaryColor.withOpacity(0.5) : primaryColor;

    // The update check logic from Svelte (`checkForUpdate`) was likely Tauri-specific.
    // You'll need to re-implement it using a Flutter package like `upgrader`
    // or your own update mechanism.

    return Scaffold(
      backgroundColor: bgColor,
      body: Row(
        children: [
          Sidebar(currentRoute: widget.currentRoute),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border.all(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: widget.child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
