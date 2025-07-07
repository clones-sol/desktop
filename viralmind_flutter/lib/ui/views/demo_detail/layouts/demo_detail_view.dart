import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/session/provider.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/components/wallet_not_connected.dart';
import 'package:viralmind_flutter/ui/views/demo_detail/bloc/provider.dart';
import 'package:viralmind_flutter/ui/views/demo_detail/layouts/components/demo_detail_editor.dart';
import 'package:viralmind_flutter/ui/views/demo_detail/layouts/components/demo_detail_events.dart';
import 'package:viralmind_flutter/ui/views/demo_detail/layouts/components/demo_detail_infos.dart';
import 'package:viralmind_flutter/ui/views/demo_detail/layouts/components/demo_detail_rewards.dart';
import 'package:viralmind_flutter/ui/views/demo_detail/layouts/components/demo_detail_steps.dart';
import 'package:viralmind_flutter/ui/views/demo_detail/layouts/components/demo_detail_submission_result.dart';
import 'package:viralmind_flutter/ui/views/demo_detail/layouts/components/demo_detail_video_preview.dart';
import 'package:viralmind_flutter/utils/breakpoints.dart';

class DemoDetailView extends ConsumerStatefulWidget {
  const DemoDetailView({super.key, required this.recordingId});

  static const String routeName = '/demo-detail';

  final String recordingId;

  @override
  ConsumerState<DemoDetailView> createState() => _DemoDetailViewState();
}

class _DemoDetailViewState extends ConsumerState<DemoDetailView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await ref
          .read(demoDetailNotifierProvider.notifier)
          .loadRecording(widget.recordingId);
    });
  }

  String _getPlatformOpenFileExplorerName() {
    if (Platform.isMacOS) {
      return 'Finder';
    } else if (Platform.isWindows) {
      return 'Explorer';
    }
    return 'Files';
  }

  Widget _buildFooter(BuildContext context, WidgetRef ref) {
    final walletAddress =
        ref.watch(sessionNotifierProvider.select((s) => s.address));

    final demoDetail = ref.watch(demoDetailNotifierProvider);
    final recording = demoDetail.recording;
    final submission = recording?.submission;
    final demoDetailNotifier = ref.watch(demoDetailNotifierProvider.notifier);
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BtnPrimary(
          btnPrimaryType: BtnPrimaryType.outlinePrimary,
          buttonText: 'Open in ${_getPlatformOpenFileExplorerName()}',
          onTap: demoDetailNotifier.openRecordingFolder,
        ),
        if (recording != null && recording.status == 'completed') ...[
          if (demoDetail.sftMessages.isEmpty)
            BtnPrimary(
              btnPrimaryType: BtnPrimaryType.outlinePrimary,
              onTap: demoDetailNotifier.processRecording,
              isLoading: demoDetail.isProcessing,
              buttonText: 'Process',
            ),
          BtnPrimary(
            btnPrimaryType: BtnPrimaryType.outlinePrimary,
            onTap: demoDetailNotifier.exportRecording,
            isLoading: demoDetail.isExporting,
            buttonText: 'Export Zip',
          ),
          BtnPrimary(
            onTap: demoDetailNotifier.uploadRecording,
            isLoading: demoDetail.isUploading,
            isLocked: walletAddress == null ||
                submission?.status == 'completed' ||
                (submission != null && submission.status != 'failed'),
            buttonText: submission?.status == 'completed'
                ? '✓ Uploaded'
                : submission?.status == 'failed'
                    ? 'Failed'
                    : submission != null
                        ? 'Processing...'
                        : 'Upload',
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionNotifierProvider);
    if (session.isConnected == false) {
      return const WalletNotConnected();
    }

    final demoDetail = ref.watch(demoDetailNotifierProvider);

    if (demoDetail.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (demoDetail.recording == null) {
      return const Center(child: Text('Recording not found'));
    }

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > Breakpoints.desktop) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DemoDetailInfos(),
                            SizedBox(height: 20),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: DemoDetailVideoPreview(),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    flex: 4,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          DemoDetailSteps(),
                                          SizedBox(height: 20),
                                          DemoDetailSubmissionResult(),
                                          SizedBox(height: 20),
                                          DemoDetailRewards(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 3,
                        child: CardWidget(
                          child: DefaultTabController(
                            length: 2,
                            child: Column(
                              children: [
                                TabBar(
                                  labelColor: VMColors.secondary,
                                  unselectedLabelColor: VMColors.secondaryText,
                                  dividerColor: VMColors.secondary,
                                  tabs: const [
                                    Tab(text: 'Editor'),
                                    Tab(text: 'Events'),
                                  ],
                                ),
                                const Expanded(
                                  child: TabBarView(
                                    children: [
                                      DemoDetailEditor(),
                                      DemoDetailEvents(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const DemoDetailInfos(),
                      const SizedBox(height: 20),
                      const DemoDetailVideoPreview(),
                      const SizedBox(height: 20),
                      const DemoDetailSteps(),
                      const SizedBox(height: 20),
                      const DemoDetailSubmissionResult(),
                      const SizedBox(height: 20),
                      const DemoDetailRewards(),
                      const SizedBox(height: 20),
                      CardWidget(
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TabBar(
                                labelColor: VMColors.secondary,
                                unselectedLabelColor: VMColors.secondaryText,
                                dividerColor: VMColors.secondary,
                                tabs: const [
                                  Tab(text: 'Editor'),
                                  Tab(text: 'Events'),
                                ],
                              ),
                              const SizedBox(
                                height: 400,
                                child: TabBarView(
                                  children: [
                                    DemoDetailEditor(),
                                    DemoDetailEvents(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          _buildFooter(context, ref),
        ],
      ),
    );
  }
}
