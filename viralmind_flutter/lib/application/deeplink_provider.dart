import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/application/tauri_api.dart';

part 'deeplink_provider.g.dart';

@riverpod
Stream<String> deepLink(Ref ref) {
  final tauriApi = ref.watch(tauriApiClientProvider);
  final controller = StreamController<String>();

  Timer.periodic(const Duration(seconds: 2), (timer) async {
    try {
      final url = await tauriApi.getDeepLink();
      if (url != null && url.isNotEmpty) {
        controller.add(url);
      }
    } catch (e) {
      // Ignore errors for now, as the server might not be running
      // or the endpoint might not be available yet.
      debugPrint('Error getting deep link: $e');
    }
  });

  ref.onDispose(controller.close);

  return controller.stream;
}
