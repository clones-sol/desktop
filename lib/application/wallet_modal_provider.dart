import 'package:flutter_riverpod/flutter_riverpod.dart';

final walletModalProvider =
    StateNotifierProvider<WalletModalNotifier, bool>((ref) {
  return WalletModalNotifier();
});

class WalletModalNotifier extends StateNotifier<bool> {
  WalletModalNotifier() : super(false);

  void show() {
    state = true;
  }

  void hide() {
    state = false;
  }
}
