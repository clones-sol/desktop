import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/application/connection_token.dart';
import 'package:viralmind_flutter/application/wallet.dart';
import 'package:viralmind_flutter/ui/components/upload_manager.dart';
import 'package:viralmind_flutter/ui/components/wallet_button.dart';

class Sidebar extends ConsumerWidget {
  const Sidebar({
    super.key,
    required this.currentRoute,
    this.isRecording = false,
    this.isRecordingLoading = false,
    this.onStopRecording,
  });
  final String currentRoute;
  final bool isRecording;
  final bool isRecordingLoading;
  final VoidCallback? onStopRecording;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletAddress = ref.watch(walletAddressProvider).valueOrNull;
    final connectionNotifier =
        ref.watch(connectionTokenNotifierProvider.notifier);
    final isConnecting = connectionNotifier.isConnecting;
    final viralBalance = walletAddress != null
        ? ref.watch(getBalanceProvider(address: walletAddress))
        : null;

    final buttons = [
      SidebarButtonData(
        path: '/app/gym',
        imagePath: Assets.gymIcon,
        label: 'Gym',
      ),
      SidebarButtonData(
        path: '/app/leaderboards',
        imagePath: Assets.statsIcon,
        label: 'Leaderboards',
      ),
      SidebarButtonData(
        path: '/app/forge',
        imagePath: Assets.forgeIcon,
        label: 'Forge',
      ),
    ];

    return Container(
      width: 64,
      color: Colors.transparent,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Image.asset(
              Assets.logoIcon,
              height: 32,
              width: 32,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: _SidebarSection(
              buttons: buttons,
              currentRoute: currentRoute,
            ),
          ),
          const Spacer(),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: UploadManagerWidget(
              uploadManager: UploadManager(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: WalletButton(
              isConnected: walletAddress != null,
              walletAddress: walletAddress,
              viralBalance: viralBalance,
              isConnecting: isConnecting,
              onDisconnect: connectionNotifier.disconnectWallet,
              onEditNickname: () {
                // TODO: Implement nickname editing
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarSection extends StatelessWidget {
  const _SidebarSection({
    required this.buttons,
    required this.currentRoute,
  });

  final List<SidebarButtonData> buttons;
  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...buttons.map((button) {
          final isActive = currentRoute.startsWith(button.path);
          return isActive
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        width: 70,
                        height: 70,
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
                    _buildButton(
                      context,
                      button,
                    ),
                  ],
                )
              : Opacity(
                  opacity: 0.7,
                  child: _buildButton(
                    context,
                    button,
                  ),
                );
        }),
      ],
    );
  }

  Widget _buildButton(BuildContext context, SidebarButtonData button) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
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
          child: Image.asset(
            button.imagePath,
            width: 40,
            height: 40,
          ),
        ),
        onTap: () {
          context.go(button.path);
        },
      ),
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
