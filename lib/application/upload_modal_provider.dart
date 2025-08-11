import 'package:flutter_riverpod/flutter_riverpod.dart';

final uploadModalProvider =
    StateNotifierProvider<UploadModalNotifier, bool>((ref) {
  return UploadModalNotifier();
});

class UploadModalNotifier extends StateNotifier<bool> {
  UploadModalNotifier() : super(false);

  void show() {
    state = true;
  }

  void hide() {
    state = false;
  }
}
