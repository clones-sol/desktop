import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/session/provider.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/wallet_not_connected.dart';

class HubView extends ConsumerWidget {
  const HubView({super.key});

  static const String routeName = '/hub';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionNotifierProvider);
    if (session.isConnected == false) {
      return const WalletNotConnected();
    }

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to the Hub',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                  color: VMColors.secondaryText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
