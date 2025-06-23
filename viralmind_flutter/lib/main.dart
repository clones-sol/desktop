import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/main_layout.dart';
import 'package:viralmind_flutter/ui/views/forge/forge_view.dart';
import 'package:viralmind_flutter/ui/views/gym/layouts/gym_view.dart';
import 'package:viralmind_flutter/ui/views/gym_history/layouts/gym_history_view.dart';
import 'package:viralmind_flutter/ui/views/leaderboards/layouts/leaderboards_view.dart';
import 'package:viralmind_flutter/ui/views/skills_tree/layouts/skill_tree_view.dart';
import 'package:viralmind_flutter/ui/views/training_session/layouts/training_session_view.dart';

final _router = GoRouter(
  initialLocation: GymView.routeName,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(
          currentRoute: state.uri.path,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: GymView.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: GymView(),
          ),
        ),
        GoRoute(
          path: GymHistoryView.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: GymHistoryView(),
          ),
        ),
        GoRoute(
          path: ForgeView.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ForgeView(),
          ),
        ),
        GoRoute(
          path: LeaderboardsView.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: LeaderboardsView(),
          ),
        ),
        GoRoute(
          path: SkillTreeView.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SkillTreeView(),
          ),
        ),
        GoRoute(
          path: TrainingSessionView.routeName,
          pageBuilder: (context, state) {
            final extraData = state.extra as Map<String, dynamic>?;
            final appParam = extraData?['appParam'];
            final poolId = extraData?['poolId'];
            final prompt = extraData?['prompt'];
            return NoTransitionPage(
              child: TrainingSessionView(
                appParam: appParam,
                poolId: poolId,
                prompt: prompt,
              ),
            );
          },
        ),
      ],
    ),
  ],
);

Future<void> main() async {
  // Ensure flutter is initialized.
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const ProviderScope(child: ViralmindApp()));
}

class ViralmindApp extends StatelessWidget {
  const ViralmindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Viralmind Desktop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFbb4eff)),
        fontFamily: 'Open Sans',
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: TextStyle(
                color: VMColors.secondaryText,
              ),
              bodyMedium: TextStyle(
                color: VMColors.secondaryText,
              ),
              bodyLarge: TextStyle(
                color: VMColors.secondaryText,
              ),
              titleLarge: const TextStyle(
                color: VMColors.primaryText,
              ),
              titleMedium: const TextStyle(
                color: VMColors.primaryText,
              ),
              titleSmall: const TextStyle(
                color: VMColors.primaryText,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
