import 'package:clones_desktop/application/deeplink_provider.dart';
import 'package:clones_desktop/application/route_provider.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/main_layout.dart';
import 'package:clones_desktop/ui/views/demo_detail/layouts/demo_detail_view.dart';
import 'package:clones_desktop/ui/views/forge/layouts/forge_view.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/forge_gym_deploy_tab.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/forge_gym_detail_shell.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/forge_gym_general_tab.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/forge_gym_tasks_tab.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/forge_gym_uploads_tab.dart';
import 'package:clones_desktop/ui/views/gym/layouts/gym_view.dart';
import 'package:clones_desktop/ui/views/gym_history/layouts/gym_history_view.dart';
import 'package:clones_desktop/ui/views/home/layouts/home_view.dart';
import 'package:clones_desktop/ui/views/hub/layouts/hub_view.dart';
import 'package:clones_desktop/ui/views/leaderboards/layouts/leaderboards_view.dart';
import 'package:clones_desktop/ui/views/record_overlay/layouts/record_overlay_view.dart';
import 'package:clones_desktop/ui/views/training_session/layouts/training_session_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

final _router = GoRouter(
  initialLocation: HomeView.routeName,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: HomeView.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeView(),
          ),
        ),
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
          path: DemoDetailView.routeName,
          pageBuilder: (context, state) {
            final recordingId = state.extra.toString();
            return NoTransitionPage(
              child: DemoDetailView(
                recordingId: recordingId,
              ),
            );
          },
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
    GoRoute(
      path: RecordOverlayView.routeName,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: RecordOverlayView(),
      ),
    ),
  ],
);

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  await windowManager.ensureInitialized();

  final allDisplays = await screenRetriever.getAllDisplays();
  final smallestDisplay = allDisplays.reduce((a, b) {
    final areaA = a.size.width * a.size.height;
    final areaB = b.size.width * b.size.height;
    return areaA < areaB ? a : b;
  });

  final initialSize = Size(
    smallestDisplay.size.width,
    smallestDisplay.size.height,
  );

  final windowOptions = WindowOptions(
    size: initialSize,
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const ProviderScope(child: ClonesApp()));
}

class ClonesApp extends ConsumerStatefulWidget {
  const ClonesApp({super.key});

  @override
  ConsumerState<ClonesApp> createState() => _ClonesAppState();
}

class _ClonesAppState extends ConsumerState<ClonesApp> {
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

        // Handle `clones://open` by navigating to the main view.
        if (uri.host == 'open') {
          _router.go(GymView.routeName);
          return;
        }

        // Example deeplink: clones://training-session?poolId=some-id
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

    final mediaQuery = MediaQuery.of(context);

    return MaterialApp.router(
      title: 'Clones Desktop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFbb4eff),
        ),
        textTheme: textTheme,
        snackBarTheme: SnackBarThemeData(
          width: mediaQuery.size.width * 0.5,
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
