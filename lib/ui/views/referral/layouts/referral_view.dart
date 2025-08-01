import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/ui/components/wallet_not_connected.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReferralView extends ConsumerWidget {
  const ReferralView({super.key});

  static const String routeName = '/referral';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionNotifierProvider);
    if (session.isConnected == false) {
      return const WalletNotConnected();
    }
    return const ReferralContent();
  }
}
