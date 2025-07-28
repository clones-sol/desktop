import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/domain/models/training_pool.dart';
import 'package:clones_desktop/ui/components/design_widget/message_box/message_box.dart';
import 'package:clones_desktop/ui/views/forge_detail/bloc/provider.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/components/forge_factory_general_tab_deposit_address.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/components/forge_factory_general_tab_factory_name.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/components/forge_factory_general_tab_factory_upload_limit.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/components/forge_factory_general_tab_price_per_demo.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/components/forge_factory_general_tab_stat_demo_price.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/components/forge_factory_general_tab_stat_gas_balance.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/components/forge_factory_general_tab_stat_pool_balance.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/components/forge_factory_general_tab_stat_session_completed.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/components/forge_factory_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeFactoryGeneralTab extends ConsumerWidget {
  const ForgeFactoryGeneralTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgeDetail = ref.watch(forgeDetailNotifierProvider);
    final theme = Theme.of(context);
    if (forgeDetail.pool == null) return const SizedBox.shrink();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ForgeFactoryHeader(),
          Text(
            '1. General Information',
            style: theme.textTheme.titleMedium,
          ),
          if (forgeDetail.pool!.status == TrainingPoolStatus.noGas ||
              forgeDetail.pool!.status == TrainingPoolStatus.noFunds)
            _buildNoFundsMessageBox(context, ref),
          const SizedBox(height: 20),
          _buildGlobalStats(ref),
          const SizedBox(height: 20),
          const SizedBox(
            child: SizedBox(
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ForgeFactoryGeneralTabFactoryName(),
                  SizedBox(width: 20),
                  ForgeFactoryGeneralTabPricePerDemo(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(
            child: SizedBox(
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ForgeFactoryGeneralTabDepositAddress(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const ForgeFactoryGeneralTabFactoryUploadLimit(),
        ],
      ),
    );
  }

  Widget _buildNoFundsMessageBox(BuildContext context, WidgetRef ref) {
    final forgeDetail = ref.watch(forgeDetailNotifierProvider);
    if (forgeDetail.pool == null) {
      return const SizedBox.shrink();
    }
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: mediaQuery.size.width,
        child: MessageBox(
          messageBoxType: MessageBoxType.warning,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                forgeDetail.pool!.status == TrainingPoolStatus.noGas
                    ? 'Insufficient SOL for Gas'
                    : 'Insufficient ${forgeDetail.pool!.token.symbol} Tokens',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ClonesColors.primaryText,
                ),
              ),
              Text(
                forgeDetail.pool!.status == TrainingPoolStatus.noGas
                    ? 'Your factory needs min $kMinSolBalance SOL to pay for on-chain transactions. Without gas, the factory cannot function on the Solana blockchain.'
                    : "Your factory needs ${forgeDetail.pool!.token.symbol} tokens to reward users who provide demonstrations. Without funds, users won't receive compensation.",
                style: TextStyle(
                  color: ClonesColors.secondaryText,
                ),
              ),
              Text(
                'Deposit ${forgeDetail.pool!.status == TrainingPoolStatus.noGas ? 'SOL' : forgeDetail.pool!.token.symbol} to the address above to activate your factory and start collecting data.',
                style: TextStyle(
                  color: ClonesColors.secondaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlobalStats(WidgetRef ref) {
    final forgeDetail = ref.watch(forgeDetailNotifierProvider);
    if (forgeDetail.pool == null) {
      return const SizedBox.shrink();
    }
    return const SizedBox(
      height: 160,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          ForgeFactoryGeneralTabStatSessionCompleted(),
          ForgeFactoryGeneralTabStatDemoPrice(),
          ForgeFactoryGeneralTabStatPoolBalance(),
          ForgeFactoryGeneralTabStatGasBalance(),
        ],
      ),
    );
  }
}
