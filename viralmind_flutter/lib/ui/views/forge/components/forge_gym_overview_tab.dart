import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/components/stats_card.dart';
import 'package:viralmind_flutter/ui/utils/wallet.dart';

class ForgeGymOverviewTab extends StatelessWidget {
  const ForgeGymOverviewTab({super.key, required this.pool});
  final TrainingPool pool;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pool.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          _buildGlobalStats(),
          const SizedBox(height: 24),
          Text(
            'Deposit Address',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            children: [
              Expanded(
                child: SelectableText(
                  pool.depositAddress,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: pool.depositAddress));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Address copied!')),
                  );
                },
              ),
            ],
          ),
          Text(
            'Send ${pool.token.symbol} tokens to this address to fund your gym.',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          // Email notification UI (simplifié)
          Text('Notifications', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          const Text(
            'Get an email when your gym runs out of VIRAL or SOL for gas fees.',
          ),
          Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: 'example@example.com'),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Save')),
            ],
          ),
          const SizedBox(height: 24),
          if (pool.status == TrainingPoolStatus.noGas ||
              pool.status == TrainingPoolStatus.noFunds)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                border: const Border(
                  left: BorderSide(color: Colors.amber, width: 4),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning, color: Colors.amber),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pool.status == TrainingPoolStatus.noGas
                              ? 'Insufficient SOL for Gas'
                              : 'Insufficient VIRAL Tokens',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          pool.status == TrainingPoolStatus.noGas
                              ? 'Your gym needs SOL to pay for on-chain transactions. Without gas, the gym cannot function on the Solana blockchain.'
                              : "Your gym needs VIRAL tokens to reward users who provide demonstrations. Without funds, users won't receive compensation.",
                        ),
                        Text(
                          'Deposit ${pool.status == TrainingPoolStatus.noGas ? 'SOL' : 'VIRAL'} to the address above to activate your gym and start collecting data.',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
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
                value: pool.demonstrations.toString(),
              ),
              StatCard(
                label: 'Reward Per Demo',
                value:
                    '${formatNumberWithSeparator(pool.pricePerDemo ?? 1)}\n\$${pool.token.symbol}',
              ),
              StatCard(
                label: 'Pool Balance',
                value:
                    '${formatNumberWithSeparator(pool.funds)}\n\$${pool.token.symbol}',
              ),
              StatCard(
                label: 'Gas Balance',
                value:
                    '${formatNumberWithSeparator(pool.solBalance ?? 0)}\n\$SOL',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
