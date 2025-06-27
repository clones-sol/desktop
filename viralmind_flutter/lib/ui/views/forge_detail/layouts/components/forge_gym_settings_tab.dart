import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/components/design_widget/message_box/message_box.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/bloc/provider.dart';
import 'package:viralmind_flutter/utils/format_num.dart';

class ForgeGymSettingsTab extends ConsumerStatefulWidget {
  const ForgeGymSettingsTab({super.key});

  static const String routeName = '/forge/gym/settings';

  @override
  ConsumerState<ForgeGymSettingsTab> createState() =>
      _ForgeGymSettingsTabState();
}

class _ForgeGymSettingsTabState extends ConsumerState<ForgeGymSettingsTab> {
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;
  bool _enableUploadLimit = false;
  int _uploadLimit = 10;
  String _limitType = 'per-task';

  @override
  void initState() {
    super.initState();
    final pool = ref.read(forgeDetailNotifierProvider).pool;
    _nameController = TextEditingController(text: pool?.name);
    _priceController =
        TextEditingController(text: pool?.pricePerDemo?.toString() ?? '1');
    if (pool != null) {
      _enableUploadLimit = pool.uploadLimit != null;
      _uploadLimit = pool.uploadLimit?.type ?? 10;
      _limitType = (pool.uploadLimit?.limitType ?? 'per-task').toString();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(forgeDetailNotifierProvider.select((value) => value.pool),
        (previous, next) {
      if (previous == next || next == null) return;
      if (_nameController.text != next.name) {
        _nameController.text = next.name;
      }
      final price = next.pricePerDemo?.toString() ?? '1';
      if (_priceController.text != price) {
        _priceController.text = price;
      }

      setState(() {
        _enableUploadLimit = next.uploadLimit != null;
        _uploadLimit = next.uploadLimit?.type ?? 10;
        _limitType = (next.uploadLimit?.limitType ?? 'per-task').toString();
      });
    });
    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    if (pool == null) return const SizedBox.shrink();

    final tokenSymbol = pool.token.symbol;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1. General Information',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (pool.status == TrainingPoolStatus.noGas ||
              pool.status == TrainingPoolStatus.noFunds)
            _buildNoFundsMessageBox(),
          const SizedBox(height: 20),
          _buildGlobalStats(),
          const SizedBox(height: 20),
          SizedBox(
            child: SizedBox(
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CardWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: VMColors.containerIcon4
                                      .withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: VMColors.containerIcon4
                                      .withValues(alpha: 0.7),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gym Name',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Text(
                                    'This name will be visible to users.',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      width: 0.5,
                                    ),
                                    gradient:
                                        VMColors.gradientInputFormBackground,
                                  ),
                                  child: TextField(
                                    controller: _nameController,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 12,
                                      ),
                                      hintText: 'Enter gym name',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.color!
                                                .withValues(alpha: 0.2),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CardWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: VMColors.containerIcon1
                                      .withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.price_check_outlined,
                                  color: VMColors.containerIcon3
                                      .withValues(alpha: 0.7),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Price per demonstration',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Text(
                                    'Set the price for each demonstration. Minimum price: 1 $tokenSymbol',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          width: 0.5,
                                        ),
                                        gradient: VMColors
                                            .gradientInputFormBackground,
                                      ),
                                      child: TextField(
                                        controller: _priceController,
                                        keyboardType: TextInputType.number,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 12,
                                          ),
                                          hintText: 'Reward per demo',
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.color!
                                                    .withValues(alpha: 0.2),
                                              ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          tokenSymbol,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            child: SizedBox(
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CardWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: VMColors.containerIcon2
                                      .withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.call_received,
                                  color: VMColors.containerIcon2
                                      .withValues(alpha: 0.7),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Deposit Address',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Text(
                                    'Send $tokenSymbol tokens to fund this gym',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient:
                                        VMColors.gradientInputFormBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 12,
                                    ),
                                    child: SelectableText(
                                      pool.depositAddress,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              BtnPrimary(
                                buttonText: 'Copy',
                                onTap: () {
                                  Clipboard.setData(
                                    ClipboardData(text: pool.depositAddress),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Address copied!'),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CardWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: VMColors.containerIcon1
                                      .withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.email,
                                  color: VMColors.containerIcon1
                                      .withValues(alpha: 0.7),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Receive alerts',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Text(
                                    'Get an email when your gym runs out of $tokenSymbol or SOL for gas fees.',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer,
                                              width: 0.5,
                                            ),
                                            gradient: VMColors
                                                .gradientInputFormBackground,
                                          ),
                                          child: TextField(
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: VMColors.primaryText,
                                            ),
                                            autocorrect: false,
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.text,
                                            inputFormatters: <TextInputFormatter>[
                                              LengthLimitingTextInputFormatter(
                                                50,
                                              ),
                                            ],
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                left: 10,
                                              ),
                                              hintText: 'example@example.com',
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.color!
                                                        .withValues(alpha: 0.2),
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Upload Limits',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 6),
          Checkbox(
            checkColor: VMColors.primaryText,
            value: _enableUploadLimit,
            onChanged: (val) => setState(
              () => _enableUploadLimit = val ?? false,
            ),
          ),
          Text(
            'Enable gym-wide upload limits',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (_enableUploadLimit) ...[
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Limit Type',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 4),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              width: 0.5,
                            ),
                            gradient: VMColors.gradientInputFormBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton<String>(
                              value: _limitType,
                              isExpanded: true,
                              underline: const SizedBox(),
                              dropdownColor:
                                  Colors.black.withValues(alpha: 0.9),
                              style: Theme.of(context).textTheme.bodyMedium,
                              items: [
                                DropdownMenuItem(
                                  value: 'per-task',
                                  child: Text(
                                    'Per Task',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'per-day',
                                  child: Text(
                                    'Per Day',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'total',
                                  child: Text(
                                    'Total',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                              onChanged: (val) {
                                setState(() => _limitType = val ?? 'per-task');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Limit Value',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 4),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              width: 0.5,
                            ),
                            gradient: VMColors.gradientInputFormBackground,
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 14,
                              color: VMColors.primaryText,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 12,
                              ),
                              hintText: 'Value',
                            ),
                            onChanged: (val) {
                              setState(
                                () => _uploadLimit = int.tryParse(val) ?? 10,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 5),
              child: Builder(
                builder: (context) {
                  String explanation;
                  switch (_limitType) {
                    case 'per-task':
                      explanation =
                          'Limit the number of uploads per individual task.';
                      break;
                    case 'per-day':
                      explanation =
                          'Limit the number of uploads per day across all tasks.';
                      break;
                    case 'total':
                      explanation =
                          'Limit the total number of uploads across all tasks.';
                      break;
                    default:
                      explanation = '';
                  }
                  return Text(
                    explanation,
                    style: Theme.of(context).textTheme.bodySmall,
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNoFundsMessageBox() {
    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    if (pool == null) {
      return const SizedBox.shrink();
    }
    return MessageBox(
      messageBoxType: MessageBoxType.warning,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pool.status == TrainingPoolStatus.noGas
                ? 'Insufficient SOL for Gas'
                : 'Insufficient VIRAL Tokens',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: VMColors.primaryText,
            ),
          ),
          Text(
            pool.status == TrainingPoolStatus.noGas
                ? 'Your gym needs min $kMinSolBalance SOL to pay for on-chain transactions. Without gas, the gym cannot function on the Solana blockchain.'
                : "Your gym needs VIRAL tokens to reward users who provide demonstrations. Without funds, users won't receive compensation.",
            style: TextStyle(
              color: VMColors.secondaryText,
            ),
          ),
          Text(
            'Deposit ${pool.status == TrainingPoolStatus.noGas ? 'SOL' : 'VIRAL'} to the address above to activate your gym and start collecting data.',
            style: TextStyle(
              color: VMColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlobalStats() {
    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    if (pool == null) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          Expanded(child: _buildStatsCardNbDemo()),
          Expanded(child: _buildStatsCardDemoPrice()),
          Expanded(child: _buildStatsCardPoolBalance()),
          Expanded(child: _buildStatsCardGasBalance()),
        ],
      ),
    );
  }

  Widget _buildStatsCardNbDemo() {
    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    if (pool == null) {
      return const SizedBox.shrink();
    }
    final pricePerDemo = pool.pricePerDemo;
    final possibleDemos = (pricePerDemo != null && pricePerDemo > 0)
        ? (Decimal.parse(
                  pool.tokenBalance == null
                      ? '0'
                      : pool.tokenBalance.toString(),
                ) /
                Decimal.parse(pricePerDemo.toString()))
            .toDouble()
            .floor()
        : 0;

    final demoPercentage = possibleDemos > 0
        ? (pool.demonstrations / possibleDemos * 100).clamp(0, 100)
        : 0;

    if (pricePerDemo == null || pricePerDemo == 0) {
      return const SizedBox.shrink();
    }

    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: VMColors.containerIcon5.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.lightbulb_outline,
              color: VMColors.containerIcon5.withValues(alpha: 0.7),
              size: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${pool.demonstrations} / $possibleDemos',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'Sessions completed',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: 4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      VMColors.primary.withValues(alpha: 0.3),
                      VMColors.secondary.withValues(alpha: 0.3),
                      VMColors.tertiary.withValues(alpha: 0.3),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              if (pool.demonstrations >= possibleDemos)
                FractionallySizedBox(
                  widthFactor: demoPercentage / 100,
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          VMColors.rewardInfo.withValues(alpha: 0.3),
                          VMColors.rewardInfo,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                )
              else
                FractionallySizedBox(
                  widthFactor: demoPercentage / 100,
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          VMColors.secondary.withValues(alpha: 0.3),
                          VMColors.secondary,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCardDemoPrice() {
    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    if (pool == null) {
      return const SizedBox.shrink();
    }
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: VMColors.containerIcon1.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.card_giftcard,
                  color: VMColors.containerIcon1.withValues(alpha: 0.7),
                  size: 20,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: VMColors.containerIcon1.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  pool.token.symbol,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: VMColors.containerIcon1.withValues(alpha: 0.7),
                        fontSize: 10,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '${formatNumberWithSeparator(pool.pricePerDemo)} ${pool.token.symbol}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'per demonstration',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCardPoolBalance() {
    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    if (pool == null) {
      return const SizedBox.shrink();
    }
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: VMColors.containerIcon4.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: VMColors.containerIcon4.withValues(alpha: 0.7),
                  size: 20,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: VMColors.containerIcon4.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'POOL',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: VMColors.containerIcon4.withValues(alpha: 0.7),
                        fontSize: 10,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '${formatNumberWithSeparator(pool.funds)} ${pool.token.symbol}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'available',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCardGasBalance() {
    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    if (pool == null) {
      return const SizedBox.shrink();
    }
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: VMColors.containerIcon3.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.local_gas_station,
                  color: VMColors.containerIcon3.withValues(alpha: 0.7),
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '${formatNumberWithSeparator(pool.solBalance)} \$SOL',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'available for gas',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
