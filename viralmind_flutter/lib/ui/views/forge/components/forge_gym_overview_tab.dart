import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/components/design_widget/message_box/message_box.dart';
import 'package:viralmind_flutter/ui/components/stats_card.dart';
import 'package:viralmind_flutter/utils/format_num.dart';

class ForgeGymOverviewTab extends StatefulWidget {
  const ForgeGymOverviewTab({super.key, required this.pool});
  final TrainingPool pool;

  @override
  State<ForgeGymOverviewTab> createState() => _ForgeGymOverviewTabState();
}

class _ForgeGymOverviewTabState extends State<ForgeGymOverviewTab> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.pool.name);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1. General Information',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Gym Name',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 5),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.primaryContainer,
                width: 0.5,
              ),
              gradient: VMColors.gradientInputFormBackground,
            ),
            child: TextField(
              controller: _nameController,
              style: const TextStyle(fontSize: 14, color: VMColors.primaryText),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                hintText: 'Enter gym name',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deposit Address',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SelectableText(
                      widget.pool.depositAddress,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              BtnPrimary(
                buttonText: 'Copy',
                onTap: () {
                  Clipboard.setData(
                    ClipboardData(text: widget.pool.depositAddress),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Address copied!')),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          MessageBox(
            messageBoxType: MessageBoxType.info,
            content: Text(
              'Send ${widget.pool.token.symbol} tokens to this address to fund your gym.',
              style: TextStyle(
                color: VMColors.secondaryText,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Notifications',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: VMColors.primaryText,
                ),
          ),
          Text(
            'Get an email when your gym runs out of VIRAL or SOL for gas fees.',
            style: TextStyle(color: VMColors.secondaryText),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Row(
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
                                  gradient:
                                      VMColors.gradientInputFormBackground,
                                ),
                                child: TextField(
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: VMColors.primaryText,
                                  ),
                                  autocorrect: false,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  inputFormatters: <TextInputFormatter>[
                                    LengthLimitingTextInputFormatter(
                                      50,
                                    ),
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        const EdgeInsets.only(left: 10),
                                    hintText: 'example@example.com',
                                    hintStyle: TextStyle(
                                      color: VMColors.secondaryText,
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
              ),
              BtnPrimary(
                buttonText: 'Save',
                onTap: () {
                  // TODO(reddwarf03): Save email
                },
              ),
            ],
          ),
          if (widget.pool.status == TrainingPoolStatus.noGas ||
              widget.pool.status == TrainingPoolStatus.noFunds)
            _buildNoFundsMessageBox(),
          const SizedBox(height: 10),
          _buildGlobalStats(),
        ],
      ),
    );
  }

  Widget _buildNoFundsMessageBox() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: MessageBox(
        messageBoxType: MessageBoxType.warning,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.pool.status == TrainingPoolStatus.noGas
                  ? 'Insufficient SOL for Gas'
                  : 'Insufficient VIRAL Tokens',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: VMColors.primaryText,
              ),
            ),
            Text(
              widget.pool.status == TrainingPoolStatus.noGas
                  ? 'Your gym needs min $kMinSolBalance SOL to pay for on-chain transactions. Without gas, the gym cannot function on the Solana blockchain.'
                  : "Your gym needs VIRAL tokens to reward users who provide demonstrations. Without funds, users won't receive compensation.",
              style: TextStyle(
                color: VMColors.secondaryText,
              ),
            ),
            Text(
              'Deposit ${widget.pool.status == TrainingPoolStatus.noGas ? 'SOL' : 'VIRAL'} to the address above to activate your gym and start collecting data.',
              style: TextStyle(
                color: VMColors.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlobalStats() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 1.5,
            children: [
              StatCard(
                label: 'Total Demonstrations',
                value: widget.pool.demonstrations.toString(),
              ),
              StatCard(
                label: 'Reward Per Demo',
                value: formatNumberWithSeparator(widget.pool.pricePerDemo),
              ),
              StatCard(
                label: 'Pool Balance',
                value: formatNumberWithSeparator(widget.pool.funds),
              ),
              StatCard(
                label: 'Gas Balance',
                value: formatNumberWithSeparator(widget.pool.solBalance ?? 0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
