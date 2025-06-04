import 'package:flutter/material.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/wallet_button.dart';
import 'package:viralmind_flutter/ui/components/upload_manager.dart';

// TODO: Remplacer par vos providers Riverpod pour l'état d'enregistrement, navigation, etc.

class Sidebar extends StatelessWidget {
  final String currentRoute;
  final bool isRecording;
  final bool isRecordingLoading;
  final VoidCallback? onStopRecording;

  const Sidebar({
    super.key,
    required this.currentRoute,
    this.isRecording = false,
    this.isRecordingLoading = false,
    this.onStopRecording,
  });

  @override
  Widget build(BuildContext context) {
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
      // Ajouter d'autres boutons si besoin
    ];

    return Container(
      width: 64,
      color: Colors.transparent,
      child: Column(
        children: [
          const SizedBox(height: 16),
          // Logo
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Image.asset(
              Assets.logoIcon,
              height: 32,
              width: 32,
              fit: BoxFit.contain,
            ),
          ),
          // Earn section
          _SidebarSection(
            title: 'Earn',
            buttons: earnButtons,
            currentRoute: currentRoute,
          ),
          // Forge section
          _SidebarSection(
            title: 'Forge',
            buttons: spendButtons,
            currentRoute: currentRoute,
          ),
          const Spacer(),
          // Recording indicator
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
          // UploadManager
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: UploadManagerWidget(
              uploadManager:
                  UploadManager(), // TODO: utiliser le provider global
            ),
          ),
          // WalletButton
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: WalletButton(
              isConnected: false, // TODO: connecter au provider wallet
              isConnecting: false,
              onConnect: () {},
              onDisconnect: () {},
              onEditNickname: () {},
              recentSubmissions: const [],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarSection extends StatelessWidget {
  final String title;
  final List<_SidebarButtonData> buttons;
  final String currentRoute;

  const _SidebarSection({
    required this.title,
    required this.buttons,
    required this.currentRoute,
  });

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
                color: isActive ? Color(0xFFbb4eff) : Colors.grey,
                size: 24,
              ),
              onPressed: () {
                // TODO: navigation
                Navigator.of(context).pushNamed(button.path);
              },
              tooltip: button.label,
              style: IconButton.styleFrom(
                backgroundColor:
                    isActive ? Color(0xFFbb4eff) : Colors.transparent,
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
  final String path;
  final IconData icon;
  final String label;

  _SidebarButtonData({
    required this.path,
    required this.icon,
    required this.label,
  });
}
