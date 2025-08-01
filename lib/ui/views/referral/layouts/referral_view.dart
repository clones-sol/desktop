import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/components/design_widget/message_box/message_box.dart';
import 'package:clones_desktop/ui/components/menu_item.dart';
import 'package:clones_desktop/ui/components/wallet_not_connected.dart';
import 'package:clones_desktop/ui/views/referral/bloc/provider.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_content.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_header.dart';
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
    final referralState = ref.watch(referralNotifierProvider);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          const ReferralHeader(),
          Expanded(
            child: (referralState.referralInfo == null)
                ? _buildInitialState(context, ref)
                : (referralState.isLoading)
                    ? _buildLoadingState(context)
                    : (referralState.errorMessage.isNotEmpty)
                        ? _buildErrorState(context, ref)
                        : const ReferralContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialState(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);

    final menuItem = MenuItem(
      'Get Your Referral Code',
      'Generate your unique referral code to start earning rewards.',
      Assets.getReferralCodeMenu,
      () async {
        await ref.read(referralNotifierProvider.notifier).createReferral();
      },
    );

    return Center(
      child: SizedBox(
        width: mediaQuery.size.width * 0.25,
        height: mediaQuery.size.height * 0.4,
        child: MenuItemWidget(item: menuItem),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: ClonesColors.primaryText,
            strokeWidth: 1,
          ),
          const SizedBox(height: 16),
          Text(
            'Loading referral information...',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(
    BuildContext context,
    WidgetRef ref,
  ) {
    final referralState = ref.watch(referralNotifierProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MessageBox(
            messageBoxType: MessageBoxType.warning,
            content: Text(
              'Error Loading Referral: ${referralState.errorMessage}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 24),
          BtnPrimary(
            buttonText: 'Try Again',
            onTap: () async {
              await ref
                  .read(referralNotifierProvider.notifier)
                  .createReferral();
            },
          ),
        ],
      ),
    );
  }
}
