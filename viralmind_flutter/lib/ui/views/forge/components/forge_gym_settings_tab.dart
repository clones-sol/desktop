import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/components/design_widget/checkbox/checkbox_confirm.dart';

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
            '1. General Information',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Gym Name',
            style: Theme.of(context).textTheme.titleSmall,
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
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                hintText: 'Enter gym name',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'This name will be visible to users.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),

          Text(
            'Deposit Address (VIRAL)',
            style: Theme.of(context).textTheme.titleSmall,
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
                      style: Theme.of(context).textTheme.bodyMedium,
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
                onTap: () {}, // TODO(reddwarf03): brancher la logique
                icon: Icons.refresh,
                btnPrimaryType: BtnPrimaryType.outlinePrimary,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Send $tokenSymbol tokens to this address to fund your gym.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),

          Text(
            'Price per demonstration',
            style: Theme.of(context).textTheme.titleSmall,
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
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                      hintText: 'Reward per demo',
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
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
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),

          // Balance/Stats
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue[100]!),
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
          Text(
            'Notifications',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 6),
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
                            gradient: VMColors.gradientInputFormBackground,
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
                              contentPadding: const EdgeInsets.only(left: 10),
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
              const SizedBox(width: 8),
              BtnPrimary(
                buttonText: 'Save',
                onTap: () {
                  // TODO(reddwarf03): Save email
                },
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Get an email when your gym runs out of VIRAL or SOL for gas fees.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          Text(
            'Upload Limits',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 6),
          CheckboxConfirm(
            value: _enableUploadLimit,
            onChanged: (val) => setState(() => _enableUploadLimit = val),
            text: Text(
              'Enable gym-wide upload limits',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
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
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BtnPrimary(
                onTap: () {},
                buttonText: 'Refresh Balance',
                btnPrimaryType: BtnPrimaryType.outlinePrimary,
              ),
              const SizedBox(width: 16),
              BtnPrimary(
                onTap: () {},
                buttonText: 'Save',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
