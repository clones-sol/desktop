import 'package:clones_desktop/application/feature_flags.dart';
import 'package:clones_desktop/application/route_provider.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/upload_manager.dart';
import 'package:clones_desktop/ui/components/wallet_button.dart';
import 'package:clones_desktop/ui/views/demo_detail/layouts/demo_detail_view.dart';
import 'package:clones_desktop/ui/views/forge/layouts/forge_view.dart';
import 'package:clones_desktop/ui/views/gym/layouts/gym_view.dart';
import 'package:clones_desktop/ui/views/gym_history/layouts/gym_history_view.dart';
import 'package:clones_desktop/ui/views/home/layouts/home_view.dart';
import 'package:clones_desktop/ui/views/hub/layouts/hub_view.dart';
import 'package:clones_desktop/ui/views/leaderboards/layouts/leaderboards_view.dart';
import 'package:clones_desktop/ui/views/training_session/layouts/training_session_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends ConsumerWidget {
  const Sidebar({
    super.key,
    this.isRecording = false,
    this.isRecordingLoading = false,
    this.onStopRecording,
  });

  final bool isRecording;
  final bool isRecordingLoading;
  final VoidCallback? onStopRecording;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRoute = ref.watch(currentRouteProvider);
    final buttons = [
      if (FeatureFlags.enableHubFeature)
        SidebarButtonData(
          path: HubView.routeName,
          imagePath: Assets.hubIcon,
          label: 'Hub',
        ),
      SidebarButtonData(
        path: GymView.routeName,
        imagePath: Assets.gymIcon,
        label: 'Gym',
      ),
      SidebarButtonData(
        path: GymHistoryView.routeName,
        imagePath: Assets.gymHistoryIcon,
        label: 'Gym History',
      ),
      SidebarButtonData(
        path: LeaderboardsView.routeName,
        imagePath: Assets.statsIcon,
        label: 'Leaderboards',
      ),
      SidebarButtonData(
        path: ForgeView.routeName,
        imagePath: Assets.forgeIcon,
        label: 'Forge',
      ),
      SidebarButtonData(
        path: HomeView.routeName,
        imagePath: Assets.homeIcon,
        label: 'Home',
      ),
    ];

    var activeIndex = 0;
    if (currentRoute.startsWith(TrainingSessionView.routeName)) {
      activeIndex = FeatureFlags.enableHubFeature ? 1 : 0;
    } else {
      if (currentRoute.startsWith(DemoDetailView.routeName)) {
        activeIndex = FeatureFlags.enableHubFeature ? 1 : 0;
      } else {
        activeIndex =
            buttons.indexWhere((b) => currentRoute.startsWith(b.path));
        if (activeIndex == -1) activeIndex = 0;
      }
    }

    return Container(
      width: 64,
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            child: AnimatedSidebarSection(
              buttons: buttons,
              activeIndex: activeIndex,
              onTap: (i) {
                context.go(buttons[i].path);
              },
            ),
          ),
          Column(
            children: [
              if (isRecording)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: IconButton(
                    icon: const Icon(Icons.stop, color: Colors.white, size: 32),
                    onPressed: onStopRecording,
                    tooltip: 'Stop Recording',
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: const CircleBorder(),
                    ),
                  ),
                )
              else if (isRecordingLoading)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: IconButton(
                    icon: const SizedBox(
                      width: 32,
                      height: 32,
                      child: CircularProgressIndicator(
                        color: Colors.red,
                        strokeWidth: 3,
                      ),
                    ),
                    onPressed: null,
                    tooltip: 'Stop Recording',
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: const CircleBorder(),
                    ),
                  ),
                ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: UploadManagerWidget(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: WalletButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnimatedSidebarSection extends StatelessWidget {
  const AnimatedSidebarSection({
    super.key,
    required this.buttons,
    required this.activeIndex,
    required this.onTap,
  });

  final List<SidebarButtonData> buttons;
  final int activeIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    const double buttonHeight = 80;
    const double sidebarWidth = 100;
    const double highlightSize = 70;
    final totalHeight = buttons.length * buttonHeight;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight;
        final topOffset = (availableHeight - totalHeight) / 2;
        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              top: topOffset +
                  activeIndex * buttonHeight +
                  (buttonHeight - highlightSize) / 2,
              left: (sidebarWidth - highlightSize) / 2,
              width: highlightSize,
              height: highlightSize,
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: VMColors.secondary.withValues(alpha: 0.2),
                      width: 0.5,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        VMColors.secondary.withValues(alpha: 0.2),
                        Colors.transparent,
                        Colors.transparent,
                        VMColors.secondary.withValues(alpha: 0.2),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: topOffset,
              left: 0,
              right: 0,
              child: Column(
                children: List.generate(buttons.length, (i) {
                  final button = buttons[i];
                  return SizedBox(
                    height: buttonHeight,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => onTap(i),
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [
                                VMColors.primary.withValues(alpha: 0.5),
                                VMColors.secondary.withValues(alpha: 0.9),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstIn,
                          child: activeIndex == i
                              ? ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    VMColors.tertiary.withValues(alpha: 1),
                                    BlendMode.srcATop,
                                  ),
                                  child: Image.asset(
                                    button.imagePath,
                                    width: 40,
                                    height: 40,
                                  ),
                                )
                              : Image.asset(
                                  button.imagePath,
                                  width: 40,
                                  height: 40,
                                ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SidebarButtonData {
  SidebarButtonData({
    required this.path,
    required this.imagePath,
    required this.label,
  });
  final String path;
  final String imagePath;
  final String label;
}
