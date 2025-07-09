import 'package:clones/assets.dart';
import 'package:clones/domain/models/token.dart';
import 'package:clones/domain/models/training_pool.dart';
import 'package:clones/ui/components/design_widget/message_box/message_box.dart';
import 'package:clones/ui/views/forge_detail/bloc/provider.dart';
import 'package:clones/ui/views/forge_detail/layouts/components/forge_gym_general_tab_alert_address.dart';
import 'package:clones/ui/views/forge_detail/layouts/components/forge_gym_general_tab_deposit_address.dart';
import 'package:clones/ui/views/forge_detail/layouts/components/forge_gym_general_tab_gym_name.dart';
import 'package:clones/ui/views/forge_detail/layouts/components/forge_gym_general_tab_gym_upload_limit.dart';
import 'package:clones/ui/views/forge_detail/layouts/components/forge_gym_general_tab_price_per_demo.dart';
import 'package:clones/ui/views/forge_detail/layouts/components/forge_gym_general_tab_stat_demo_price.dart';
import 'package:clones/ui/views/forge_detail/layouts/components/forge_gym_general_tab_stat_gas_balance.dart';
import 'package:clones/ui/views/forge_detail/layouts/components/forge_gym_general_tab_stat_pool_balance.dart';
import 'package:clones/ui/views/forge_detail/layouts/components/forge_gym_general_tab_stat_session_completed.dart';
import 'package:clones/ui/views/forge_detail/layouts/components/forge_gym_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeGymGeneralTab extends ConsumerWidget {
  const ForgeGymGeneralTab({super.key});

  static const String routeName = '/forge/gym/general';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgeDetail = ref.watch(forgeDetailNotifierProvider);

    if (forgeDetail.pool == null) return const SizedBox.shrink();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ForgeGymHeader(),
          Text(
            '1. General Information',
            style: Theme.of(context).textTheme.titleMedium,
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
                  ForgeGymGeneralTabGymName(),
                  SizedBox(width: 20),
                  ForgeGymGeneralTabPricePerDemo(),
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
                  ForgeGymGeneralTabDepositAddress(),
                  SizedBox(width: 20),
                  ForgeGymGeneralTabAlertAddress(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const ForgeGymGeneralTabGymUploadLimit(),
        ],
      ),
    );
  }

  Widget _buildNoFundsMessageBox(BuildContext context, WidgetRef ref) {
    final forgeDetail = ref.watch(forgeDetailNotifierProvider);
    if (forgeDetail.pool == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MessageBox(
          messageBoxType: MessageBoxType.warning,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                forgeDetail.pool!.status == TrainingPoolStatus.noGas
                    ? 'Insufficient ${Token.getTokenType(TokenType.sol)} for Gas'
                    : 'Insufficient ${Token.getTokenType(TokenType.clones)} Tokens',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: VMColors.primaryText,
                ),
              ),
              Text(
                forgeDetail.pool!.status == TrainingPoolStatus.noGas
                    ? 'Your gym needs min $kMinSolBalance ${Token.getTokenType(TokenType.sol)} to pay for on-chain transactions. Without gas, the gym cannot function on the Solana blockchain.'
                    : "Your gym needs ${Token.getTokenType(TokenType.clones)} tokens to reward users who provide demonstrations. Without funds, users won't receive compensation.",
                style: TextStyle(
                  color: VMColors.secondaryText,
                ),
              ),
              Text(
                'Deposit ${forgeDetail.pool!.status == TrainingPoolStatus.noGas ? Token.getTokenType(TokenType.sol) : Token.getTokenType(TokenType.clones)} to the address above to activate your gym and start collecting data.',
                style: TextStyle(
                  color: VMColors.secondaryText,
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
          ForgeGymGeneralTabStatSessionCompleted(),
          ForgeGymGeneralTabStatDemoPrice(),
          ForgeGymGeneralTabStatPoolBalance(),
          ForgeGymGeneralTabStatGasBalance(),
        ],
      ),
    );
  }
}
