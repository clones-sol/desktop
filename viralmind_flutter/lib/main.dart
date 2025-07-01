import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viralmind_flutter/application/deeplink_provider.dart';
import 'package:viralmind_flutter/application/route_provider.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/main_layout.dart';
import 'package:viralmind_flutter/ui/views/forge/layouts/forge_view.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/layouts/forge_gym_deploy_tab.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/layouts/forge_gym_general_tab.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/layouts/forge_gym_tasks_tab.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/layouts/forge_gym_uploads_tab.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/layouts/forge_gym_detail_shell.dart';
import 'package:viralmind_flutter/ui/views/gym/layouts/gym_view.dart';
import 'package:viralmind_flutter/ui/views/gym_history/layouts/gym_history_view.dart';
import 'package:viralmind_flutter/ui/views/hub/layouts/hub_view.dart';
import 'package:viralmind_flutter/ui/views/leaderboards/layouts/leaderboards_view.dart';
import 'package:viralmind_flutter/ui/views/skills_tree/layouts/skill_tree_view.dart';
import 'package:viralmind_flutter/ui/views/training_session/layouts/training_session_view.dart';

final _router = GoRouter(
  initialLocation: HubView.routeName,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: HubView.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HubView(),
          ),
        ),
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
        ShellRoute(
          pageBuilder: (context, state, child) {
            final poolId = state.pathParameters['id']!;
            return NoTransitionPage(
              child: ForgeGymDetailShell(
                poolId: poolId,
                child: child,
              ),
            );
          },
          routes: [
            GoRoute(
              path: '/forge/:id/general',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ForgeGymGeneralTab());
              },
            ),
            GoRoute(
              path: '/forge/:id/tasks',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ForgeGymTasksTab());
              },
            ),
            GoRoute(
              path: '/forge/:id/uploads',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ForgeGymUploadsTab());
              },
            ),
            GoRoute(
              path: '/forge/:id/deploy',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ForgeGymDeployTab());
              },
            ),
          ],
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
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const ProviderScope(child: ViralmindApp()));
}

class ViralmindApp extends ConsumerStatefulWidget {
  const ViralmindApp({super.key});

  @override
  ConsumerState<ViralmindApp> createState() => _ViralmindAppState();
}

class _ViralmindAppState extends ConsumerState<ViralmindApp> {
  @override
  void initState() {
    super.initState();
    _router.routeInformationProvider.addListener(_updateRoute);
    // Set initial route
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateRoute();
    });
  }

  void _updateRoute() {
    if (!mounted) return;
    final location = _router.routeInformationProvider.value.uri.toString();
    // The router location can be empty at the very beginning.
    if (location.isEmpty) return;
    final current = ref.read(currentRouteProvider);
    if (current != location) {
      ref.read(currentRouteProvider.notifier).state = location;
    }
  }

  @override
  void dispose() {
    _router.routeInformationProvider.removeListener(_updateRoute);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen for deep link events and navigate accordingly.
    ref.listen(deepLinkProvider, (previous, next) {
      final url = next.value;
      if (url != null && url.isNotEmpty) {
        final uri = Uri.parse(url);

        // Handle `viralmind://open` by navigating to the main view.
        if (uri.host == 'open') {
          _router.go(GymView.routeName);
          return;
        }

        // Example deeplink: viralmind://training-session?poolId=some-id
        // You can expand this logic to handle different routes.
        if (uri.host == 'training-session') {
          _router.go(
            TrainingSessionView.routeName,
            extra: {
              'poolId': uri.queryParameters['poolId'],
              'prompt': uri.queryParameters['prompt'],
            },
          );
        } else {
          // Fallback or navigate to other routes based on the host
          _router.go('/${uri.host}');
        }
      }
    });

    final textTheme = GoogleFonts.interTextTheme(
      ThemeData.light().textTheme,
    ).copyWith(
      bodySmall: TextStyle(color: VMColors.secondaryText),
      bodyMedium: TextStyle(color: VMColors.secondaryText),
      bodyLarge: TextStyle(color: VMColors.secondaryText),
      titleLarge: const TextStyle(color: VMColors.primaryText),
      titleMedium: const TextStyle(color: VMColors.primaryText),
      titleSmall: const TextStyle(color: VMColors.primaryText),
    );

    return MaterialApp.router(
      title: 'Viralmind Desktop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFbb4eff),
        ),
        textTheme: textTheme,
        snackBarTheme: SnackBarThemeData(
          width: MediaQuery.of(context).size.width * 0.5,
          backgroundColor: VMColors.tertiary.withValues(alpha: 0.7),
          elevation: 2,
          contentTextStyle: textTheme.bodyMedium,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: VMColors.tertiary,
            ),
          ),
          closeIconColor: VMColors.primaryText,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
