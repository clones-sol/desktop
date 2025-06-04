import 'package:flutter/material.dart';
import 'package:viralmind_flutter/ui/components/sidebar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final String currentRoute;
  final bool isRecording;
  final bool isRecordingLoading;
  final VoidCallback? onStopRecording;

  const MainLayout({
    super.key,
    required this.child,
    required this.currentRoute,
    this.isRecording = false,
    this.isRecordingLoading = false,
    this.onStopRecording,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Sidebar(
            currentRoute: currentRoute,
            isRecording: isRecording,
            isRecordingLoading: isRecordingLoading,
            onStopRecording: onStopRecording,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  border: Border.all(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
