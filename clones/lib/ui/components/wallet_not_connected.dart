import 'package:clones/application/session/provider.dart';
import 'package:clones/assets.dart';
import 'package:clones/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class WalletNotConnected extends ConsumerWidget {
  const WalletNotConnected({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0.05,
          child: Image.asset(
            Assets.walletToConnectIconWB,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please, connect your Solana wallet to start using the app',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            BtnPrimary(
              onTap: () => _handleConnect(ref),
              buttonText: 'Connect',
            ),
          ],
        ),
      ],
    );
  }
}

Future<void> _handleConnect(WidgetRef ref) async {
  await ref.read(sessionNotifierProvider.notifier).getConnectionUrl();
  final session = ref.read(sessionNotifierProvider);

  final uri = Uri.parse(session.connectionUrl);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
    await ref.read(sessionNotifierProvider.notifier).startPolling();
  }
}
