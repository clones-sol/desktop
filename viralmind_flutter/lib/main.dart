import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/main_layout.dart';
import 'package:viralmind_flutter/ui/views/forge/forge_view.dart';
import 'package:viralmind_flutter/ui/views/gym/gym_view.dart';
import 'package:viralmind_flutter/ui/views/leaderboards/leaderboards_view.dart';
import 'package:viralmind_flutter/ui/views/training_session/training_session_view.dart';

final _router = GoRouter(
  initialLocation: '/app/forge',
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
          path: '/app/gym',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: GymView(),
          ),
        ),
        GoRoute(
          path: '/app/forge',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ForgeView(),
          ),
        ),
        GoRoute(
          path: '/app/leaderboards',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: LeaderboardsView(),
          ),
        ),
        GoRoute(
          path: '/app/chat',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: TrainingSessionView(),
          ),
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
