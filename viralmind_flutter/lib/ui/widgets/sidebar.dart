import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatelessWidget {
  final String currentRoute;

  const Sidebar({
    super.key,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.grey[100],
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text('Viralmind',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          _SidebarItem(
            icon: FontAwesomeIcons.dumbbell,
            title: 'Gym',
            path: '/app/gym',
            currentRoute: currentRoute,
          ),
          _SidebarItem(
            icon: FontAwesomeIcons.fire,
            title: 'Forge',
            path: '/app/forge',
            currentRoute: currentRoute,
          ),
          _SidebarItem(
            icon: FontAwesomeIcons.trophy,
            title: 'Leaderboards',
            path: '/app/leaderboards',
            currentRoute: currentRoute,
          ),
          _SidebarItem(
            icon: FontAwesomeIcons.message,
            title: 'Chat',
            path: '/app/chat',
            currentRoute: currentRoute,
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String path;
  final String currentRoute;

  const _SidebarItem({
    required this.icon,
    required this.title,
    required this.path,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentRoute.startsWith(path);
    final theme = Theme.of(context);

    return Material(
      color:
          isSelected ? theme.primaryColor.withOpacity(0.1) : Colors.transparent,
      child: InkWell(
        onTap: () => context.go(path),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              FaIcon(icon,
                  color: isSelected ? theme.primaryColor : Colors.grey[600]),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isSelected ? theme.primaryColor : Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
