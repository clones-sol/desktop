import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:viralmind_flutter/ui/main_layout.dart';
import 'package:viralmind_flutter/ui/views/gym/gym_view.dart';
import 'package:viralmind_flutter/ui/views/forge/forge_view.dart';
import 'package:viralmind_flutter/ui/views/leaderboards/leaderboards_view.dart';
import 'package:viralmind_flutter/ui/views/chat/chat_view.dart';

Future<void> main() async {
  // Charge les variables d'environnement depuis le fichier .env
  await dotenv.load();
  runApp(const ViralmindApp());
}

class ViralmindApp extends StatelessWidget {
  const ViralmindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viralmind Desktop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFbb4eff)),
        fontFamily: 'Open Sans',
        useMaterial3: true,
      ),
      initialRoute: '/app/gym',
      routes: {
        '/app/gym':
            (context) =>
                const MainLayout(currentRoute: '/app/gym', child: GymView()),
        '/app/forge':
            (context) => const MainLayout(
              currentRoute: '/app/forge',
              child: ForgeView(),
            ),
        '/app/leaderboards':
            (context) => const MainLayout(
              currentRoute: '/app/leaderboards',
              child: LeaderboardsView(),
            ),
        '/app/chat':
            (context) =>
                const MainLayout(currentRoute: '/app/chat', child: ChatView()),
      },
      onUnknownRoute:
          (settings) => MaterialPageRoute(
            builder:
                (context) => const MainLayout(
                  currentRoute: '/app/gym',
                  child: GymView(),
                ),
          ),
    );
  }
}
