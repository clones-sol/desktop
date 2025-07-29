import 'package:clones_desktop/application/deeplink_provider.dart';
import 'package:clones_desktop/application/route_provider.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/main_layout.dart';
import 'package:clones_desktop/ui/views/demo_detail/layouts/demo_detail_view.dart';
import 'package:clones_desktop/ui/views/factory/layouts/factory_view.dart';
import 'package:clones_desktop/ui/views/factory_history/layouts/factory_history_view.dart';
import 'package:clones_desktop/ui/views/forge/layouts/forge_view.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/forge_factory_deploy_tab.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/forge_factory_detail_shell.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/forge_factory_general_tab.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/forge_factory_tasks_tab.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/forge_factory_uploads_tab.dart';
import 'package:clones_desktop/ui/views/home/layouts/home_view.dart';
import 'package:clones_desktop/ui/views/hub/layouts/hub_view.dart';
import 'package:clones_desktop/ui/views/leaderboards/layouts/leaderboards_view.dart';
import 'package:clones_desktop/ui/views/record_overlay/layouts/record_overlay_view.dart';
import 'package:clones_desktop/ui/views/training_session/layouts/training_session_view.dart';
import 'package:clones_desktop/utils/platform_compatibility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
          path: FactoryView.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: FactoryView(),
          ),
        ),
        GoRoute(
          path: FactoryHistoryView.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: FactoryHistoryView(),
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
              child: ForgeFactoryDetailShell(
                poolId: poolId,
                child: child,
              ),
            );
          },
          routes: [
            GoRoute(
              path: '/forge/:id/general',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ForgeFactoryGeneralTab());
              },
            ),
            GoRoute(
              path: '/forge/:id/tasks',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ForgeFactoryTasksTab());
              },
            ),
            GoRoute(
              path: '/forge/:id/uploads',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ForgeFactoryUploadsTab());
              },
            ),
            GoRoute(
              path: '/forge/:id/deploy',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ForgeFactoryDeployTab());
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

  // Only initialize window manager for desktop platforms
  if (!kIsWeb) {
    await WindowManagerWeb.ensureInitialized();

    final allDisplays = await ScreenRetrieverWeb.getAllDisplays();
    final smallestDisplay = allDisplays.reduce((a, b) {
      final areaA = a.size.width * a.size.height;
      final areaB = b.size.width * b.size.height;
      return areaA < areaB ? a : b;
    });

    final initialSize = Size(
      smallestDisplay.size.width,
      smallestDisplay.size.height,
    );

    await WindowManagerWeb.waitUntilReadyToShow();
    await WindowManagerWeb.setSize(initialSize);
    await WindowManagerWeb.center();
    await WindowManagerWeb.show();
  }

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
          _router.go(FactoryView.routeName);
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

    final textTheme = ThemeData.light().textTheme.copyWith(
          bodySmall: TextStyle(
            color: ClonesColors.secondaryText,
            fontFamily: ClonesFonts.primary,
          ),
          bodyMedium: TextStyle(
            color: ClonesColors.secondaryText,
            fontFamily: ClonesFonts.primary,
          ),
          bodyLarge: TextStyle(
            color: ClonesColors.secondaryText,
            fontFamily: ClonesFonts.primary,
          ),
          titleLarge: const TextStyle(
            color: ClonesColors.primaryText,
            fontFamily: ClonesFonts.primary,
          ),
          titleMedium: const TextStyle(
            color: ClonesColors.primaryText,
            fontFamily: ClonesFonts.primary,
          ),
          titleSmall: const TextStyle(
            color: ClonesColors.primaryText,
            fontFamily: ClonesFonts.primary,
          ),
          labelSmall: const TextStyle(
            fontFamily: ClonesFonts.mono,
          ),
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
          backgroundColor: ClonesColors.tertiary.withValues(alpha: 0.7),
          elevation: 2,
          contentTextStyle: textTheme.bodyMedium,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: ClonesColors.tertiary,
            ),
          ),
          closeIconColor: ClonesColors.primaryText,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
