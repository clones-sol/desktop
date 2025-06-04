// Gym recordings endpoints API
//
// Migrated from src/lib/api/endpoints/gym/recordings.ts
// NOTE: Ces fonctions nécessitent une implémentation native Flutter (platform channel/plugin).

import '../gym/quest.dart';

/// Démarre l'enregistrement d'une quest (stub, nécessite une implémentation native)
Future<void> startRecording({Quest? quest, int fps = 30}) async {
  // TODO: Implémenter l'appel natif pour démarrer l'enregistrement (platform channel/plugin)
  throw UnimplementedError(
    'startRecording is platform-specific and not implemented.',
  );
}

/// Arrête l'enregistrement (stub, nécessite une implémentation native)
Future<String> stopRecording({String? reason}) async {
  // TODO: Implémenter l'appel natif pour arrêter l'enregistrement (platform channel/plugin)
  throw UnimplementedError(
    'stopRecording is platform-specific and not implemented.',
  );
}
