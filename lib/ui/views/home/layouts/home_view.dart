import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  const MenuItem(this.title, this.description, this.imageName, this.linkRoute);
  final String title;
  final String description;
  final String imageName;
  final String linkRoute;
}

const menuItems = [
  MenuItem(
    'Create a Factory',
    'Design AI training environments and monetize your workflows.',
    Assets.menuForge,
    '/forge',
  ),
  MenuItem(
    'Farm Data',
    'Generate high-quality demonstrations and earn rewards.',
    Assets.menuFarm,
    '/gym',
  ),
];

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({super.key, required this.item});
  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return InkWell(
      onTap: () {
        context.go(item.linkRoute);
      },
      child: CardWidget(
        variant: CardVariant.secondary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  item.imageName,
                  width: mediaQuery.size.width * 0.2,
                  height: mediaQuery.size.height * 0.2,
                  color: VMColors.tertiary,
                ),
                Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    item.imageName,
                    width: mediaQuery.size.width * 0.2,
                    height: mediaQuery.size.height * 0.2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Column(
              children: [
                Text(
                  item.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: VMColors.primary,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item.description,
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Clones',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Clone your know-how',
                  style: theme.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Turn your actions into AI agents, earn rewards, and build the future of work.',
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 100),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: mediaQuery.size.width * 0.25,
                      height: mediaQuery.size.height * 0.4,
                      child: MenuItemWidget(item: menuItems[0]),
                    ),
                    SizedBox(
                      width: mediaQuery.size.width * 0.25,
                      height: mediaQuery.size.height * 0.4,
                      child: MenuItemWidget(item: menuItems[1]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
