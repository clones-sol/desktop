import 'dart:ui';
import 'package:clones_desktop/application/factory_withdraw_modal/provider.dart';
import 'package:clones_desktop/application/transaction/provider.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/components/design_widget/message_box/message_box.dart';
import 'package:clones_desktop/utils/format_num.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FactoryWithdrawModal extends ConsumerWidget {
  const FactoryWithdrawModal({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final factory = ref.watch(factoryWithdrawModalNotifierProvider).factory;
    final modalState = ref.watch(factoryWithdrawModalNotifierProvider);
    final transactionState = ref.watch(transactionManagerProvider);

    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              color: Colors.black.withValues(alpha: 0.5),
            ),
          ),
        ),
        Center(
          child: CardWidget(
            padding: CardPadding.large,
            child: SizedBox(
              width: mediaQuery.size.width * 0.4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Withdraw from Factory',
                        style: theme.textTheme.titleLarge,
                      ),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(
                                factoryWithdrawModalNotifierProvider.notifier,
                              )
                              .hide();
                        },
                        icon: Icon(
                          Icons.close,
                          color: ClonesColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (factory != null) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: theme.colorScheme.primaryContainer
                              .withValues(alpha: 0.3),
                          width: 0.5,
                        ),
                        gradient: ClonesColors.gradientInputFormBackground,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Available Balance:',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.textTheme.bodyMedium?.color!
                                  .withValues(alpha: 0.3),
                            ),
                          ),
                          Text(
                            '${formatNumberWithSeparator(factory.balance)} ${factory.token.symbol}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.textTheme.bodyMedium?.color!
                                  .withValues(alpha: 0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Withdraw Amount',
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        'Amount to withdraw from factory (you pay gas fees)',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: theme.colorScheme.primaryContainer,
                            width: 0.5,
                          ),
                          gradient: ClonesColors.gradientInputFormBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Consumer(
                            builder: (context, ref, child) {
                              return TextField(
                                onChanged: (value) {
                                  ref
                                      .read(
                                        factoryWithdrawModalNotifierProvider
                                            .notifier,
                                      )
                                      .setWithdrawAmount(value);
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                style: theme.textTheme.bodyMedium,
                                enabled: !modalState.isWithdrawing,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: modalState.isWithdrawing
                                      ? 'Processing...'
                                      : 'Enter amount to withdraw',
                                  hintStyle:
                                      theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.textTheme.bodyMedium?.color!
                                        .withValues(alpha: 0.5),
                                  ),
                                  suffixText: factory?.token.symbol,
                                  suffixStyle: theme.textTheme.bodyMedium,
                                  errorText: modalState.error?.isNotEmpty ==
                                          true
                                      ? null // Don't show error in field, we have dedicated error widget
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildGasInfo(context, ref),
                          TextButton(
                            onPressed: modalState.isWithdrawing
                                ? null
                                : () {
                                    ref
                                        .read(
                                          factoryWithdrawModalNotifierProvider
                                              .notifier,
                                        )
                                        .setMaxAmount();
                                  },
                            child: Text(
                              'MAX',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      _buildTransactionStatus(context, ref),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BtnPrimary(
                            buttonText: 'Cancel',
                            onTap: () {
                              ref
                                  .read(
                                    factoryWithdrawModalNotifierProvider
                                        .notifier,
                                  )
                                  .hide();
                            },
                            btnPrimaryType: BtnPrimaryType.outlinePrimary,
                          ),
                          const SizedBox(width: 10),
                          BtnPrimary(
                            buttonText: 'Withdraw',
                            isLoading: modalState.isWithdrawing,
                            isLocked: transactionState.awaitingCallback ||
                                modalState.withdrawAmount.isEmpty ||
                                modalState.error != null ||
                                modalState.gasExceedsAmount,
                            onTap: () {
                              ref
                                  .read(
                                    factoryWithdrawModalNotifierProvider
                                        .notifier,
                                  )
                                  .withdrawFromFactory();
                            },
                          ),

                          // Show transaction status button if there's a result
                          _buildTransactionStatusButton(context, ref),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGasInfo(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final modalState = ref.watch(factoryWithdrawModalNotifierProvider);

    if (modalState.estimatedGasCost == null && !modalState.gasExceedsAmount) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (modalState.estimatedGasCost != null) ...[
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 16,
                color: theme.textTheme.bodySmall?.color,
              ),
              const SizedBox(width: 4),
              Text(
                'Estimated gas: ${modalState.estimatedGasCost}',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ],
        if (modalState.gasExceedsAmount) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.orange.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.warning, color: Colors.orange, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Gas cost may exceed withdrawal amount. Consider increasing withdraw amount.',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTransactionStatus(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final modalState = ref.watch(factoryWithdrawModalNotifierProvider);
    final transactionState = ref.watch(transactionManagerProvider);

    // Show transaction status when withdrawing or when there's transaction info
    if (!modalState.isWithdrawing &&
        !transactionState.awaitingCallback &&
        transactionState.lastSuccessfulTx == null &&
        transactionState.error == null &&
        !transactionState.wasCancelled) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      child: MessageBox(
        messageBoxType: modalState.error != null
            ? MessageBoxType.warning
            : transactionState.awaitingCallback
                ? MessageBoxType.info
                : transactionState.lastSuccessfulTx != null
                    ? MessageBoxType.success
                    : transactionState.error != null
                        ? MessageBoxType.warning
                        : transactionState.wasCancelled
                            ? MessageBoxType.info
                            : MessageBoxType.info,
        content: Text(
          modalState.error != null
              ? modalState.error!
              : transactionState.awaitingCallback
                  ? 'Waiting for transaction confirmation in browser...'
                  : transactionState.lastSuccessfulTx != null
                      ? 'Transaction confirmed: ${transactionState.lastSuccessfulTx!.substring(0, 10)}...'
                      : transactionState.error != null
                          ? 'Transaction failed: ${transactionState.error}'
                          : transactionState.wasCancelled
                              ? 'Transaction was cancelled in browser'
                              : 'Processing withdrawal...',
          style: theme.textTheme.bodySmall?.copyWith(
            color: modalState.error != null
                ? ClonesColors.error
                : transactionState.awaitingCallback
                    ? ClonesColors.primaryText
                    : transactionState.lastSuccessfulTx != null
                        ? ClonesColors.primaryText
                        : transactionState.error != null
                            ? ClonesColors.error
                            : transactionState.wasCancelled
                                ? ClonesColors.primaryText
                                : ClonesColors.primaryText,
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionStatusButton(BuildContext context, WidgetRef ref) {
    final transactionState = ref.watch(transactionManagerProvider);
    final transactionManager = ref.watch(transactionManagerProvider.notifier);

    if (transactionState.lastSuccessfulTx == null &&
        transactionState.error == null &&
        !transactionState.wasCancelled) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        const SizedBox(width: 10),
        BtnPrimary(
          buttonText: 'Transaction Status',
          onTap: () async => transactionManager.showTransactionStatus(context),
          btnPrimaryType: BtnPrimaryType.outlinePrimary,
        ),
      ],
    );
  }
}
