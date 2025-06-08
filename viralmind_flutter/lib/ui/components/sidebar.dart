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

    // Définition des boutons
    final earnButtons = [
      _SidebarButtonData(
        path: '/app/chat',
        icon: Icons.chat_bubble_outline,
        label: 'Chat',
      ),
      _SidebarButtonData(
        path: '/app/gym',
        icon: Icons.fitness_center,
        label: 'Gym',
      ),
      _SidebarButtonData(
        path: '/app/leaderboards',
        icon: Icons.emoji_events,
        label: 'Leaderboards',
      ),
    ];

    final spendButtons = [
      _SidebarButtonData(
        path: '/app/forge',
        icon: Icons.construction,
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
          _SidebarSection(
            title: 'Earn',
            buttons: earnButtons,
            currentRoute: currentRoute,
          ),
          _SidebarSection(
            title: 'Forge',
            buttons: spendButtons,
            currentRoute: currentRoute,
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
          // WalletButton
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
    required this.title,
    required this.buttons,
    required this.currentRoute,
  });
  final String title;
  final List<_SidebarButtonData> buttons;
  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        ...buttons.map((button) {
          final isActive = currentRoute.startsWith(button.path);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: IconButton(
              icon: Icon(
                button.icon,
                color: isActive ? const Color(0xFFbb4eff) : Colors.grey,
                size: 24,
              ),
              onPressed: () {
                context.go(button.path);
              },
              tooltip: button.label,
              style: IconButton.styleFrom(
                backgroundColor:
                    isActive ? const Color(0xFFbb4eff) : Colors.transparent,
                shape: const CircleBorder(),
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _SidebarButtonData {
  _SidebarButtonData({
    required this.path,
    required this.icon,
    required this.label,
  });
  final String path;
  final IconData icon;
  final String label;
}
