import 'package:flutter/material.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/components/message_box/message_box.dart';
import 'package:viralmind_flutter/ui/components/checkbox/checkbox_confirm.dart';
import 'package:flutter/services.dart';

class ForgeGymSettingsTab extends StatefulWidget {
  const ForgeGymSettingsTab({super.key, required this.pool});
  final TrainingPool pool;

  @override
  State<ForgeGymSettingsTab> createState() => _ForgeGymSettingsTabState();
}

class _ForgeGymSettingsTabState extends State<ForgeGymSettingsTab> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  bool _enableUploadLimit = false;
  int _uploadLimit = 10;
  String _limitType = 'per-task';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.pool.name);
    _priceController = TextEditingController(
      text: widget.pool.pricePerDemo?.toString() ?? '1',
    );
    _enableUploadLimit = widget.pool.uploadLimit != null;
    _uploadLimit = widget.pool.uploadLimit?.type ?? 10;
    _limitType = (widget.pool.uploadLimit?.limitType ?? 'per-task').toString();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokenSymbol = widget.pool.token.symbol;
    final funds = widget.pool.funds;
    final pricePerDemo = double.tryParse(_priceController.text) ?? 1;
    final possibleDemos = pricePerDemo > 0 ? (funds / pricePerDemo).floor() : 0;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gym Name',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: VMColors.primaryText),
          ),
          const SizedBox(height: 6),
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
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                hintText: 'Enter gym name',
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'This name will be visible to users.',
            style: TextStyle(color: VMColors.secondaryText, fontSize: 13),
          ),
          const SizedBox(height: 20),

          Text(
            'Deposit Address (VIRAL)',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: VMColors.primaryText),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      width: 0.5,
                    ),
                    gradient: VMColors.gradientInputFormBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 12,
                    ),
                    child: SelectableText(
                      widget.pool.depositAddress,
                      style: TextStyle(
                        fontSize: 14,
                        color: VMColors.secondaryText,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
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
                icon: Icons.copy,
              ),
              const SizedBox(width: 8),
              BtnPrimary(
                buttonText: 'Refresh Balance',
                onTap: () {}, // TODO: brancher la logique
                icon: Icons.refresh,
                btnPrimaryType: BtnPrimaryType.outlinePrimary,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Send $tokenSymbol tokens to this address to fund your gym.',
            style: TextStyle(color: VMColors.secondaryText, fontSize: 13),
          ),
          const SizedBox(height: 20),

          Text(
            'Price per demonstration',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: VMColors.primaryText),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      width: 0.5,
                    ),
                    gradient: VMColors.gradientInputFormBackground,
                  ),
                  child: TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 14,
                      color: VMColors.primaryText,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      hintText: 'Reward per demo',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                tokenSymbol,
                style: TextStyle(
                  color: VMColors.secondaryText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Minimum price: 1 $tokenSymbol',
            style: TextStyle(color: VMColors.secondaryText, fontSize: 13),
          ),
          const SizedBox(height: 20),

          // Balance/Stats
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue[100]!, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Current Balance:',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${funds.toStringAsFixed(2)} $tokenSymbol',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Possible Demos:',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '$possibleDemos',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Upload Limits
          Text(
            'Upload Limits',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: VMColors.primaryText),
          ),
          const SizedBox(height: 6),
          CheckboxConfirm(
            value: _enableUploadLimit,
            onChanged: (val) => setState(() => _enableUploadLimit = val),
            text: Text(
              'Enable gym-wide upload limits',
              style: TextStyle(color: VMColors.secondaryText),
            ),
          ),
          if (_enableUploadLimit) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Limit Type',
                        style: TextStyle(
                          color: VMColors.secondaryText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
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
                            items: const [
                              DropdownMenuItem(
                                value: 'per-task',
                                child: Text('Per Task'),
                              ),
                              DropdownMenuItem(
                                value: 'per-day',
                                child: Text('Per Day'),
                              ),
                              DropdownMenuItem(
                                value: 'total',
                                child: Text('Total'),
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
                        style: TextStyle(
                          color: VMColors.secondaryText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
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
            const SizedBox(height: 8),
            Builder(
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
                  style: TextStyle(color: VMColors.secondaryText, fontSize: 13),
                );
              },
            ),
            const SizedBox(height: 12),
            // Placeholder for progress bar and stats
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[200]!, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Uploads',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '0/$_uploadLimit',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                    value: 0,
                    minHeight: 6,
                    backgroundColor: Colors.grey,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Upload stats and breakdown coming soon.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 32),
          Row(
            children: [
              BtnPrimary(
                onTap: () {},
                buttonText: 'Save',
              ),
              const SizedBox(width: 16),
              BtnPrimary(
                onTap: () {},
                buttonText: 'Refresh Balance',
                icon: Icons.refresh,
                btnPrimaryType: BtnPrimaryType.outlinePrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
