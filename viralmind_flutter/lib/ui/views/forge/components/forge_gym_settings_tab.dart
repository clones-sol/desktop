import 'package:flutter/material.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';

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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Gym Name', style: Theme.of(context).textTheme.titleMedium),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: 'Enter gym name'),
          ),
          const SizedBox(height: 16),
          Text(
            'Reward Per Demo (${widget.pool.token.symbol})',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Reward per demo'),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: _enableUploadLimit,
                onChanged: (val) {
                  setState(() => _enableUploadLimit = val ?? false);
                },
              ),
              const Text('Enable Upload Limit'),
            ],
          ),
          if (_enableUploadLimit) ...[
            Row(
              children: [
                const Text('Limit Type:'),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _limitType,
                  items: const [
                    DropdownMenuItem(
                      value: 'per-task',
                      child: Text('Per Task'),
                    ),
                    DropdownMenuItem(value: 'per-day', child: Text('Per Day')),
                    DropdownMenuItem(value: 'total', child: Text('Total')),
                  ],
                  onChanged: (val) {
                    setState(() => _limitType = val ?? 'per-task');
                  },
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Value'),
                    onChanged: (val) {
                      setState(() => _uploadLimit = int.tryParse(val) ?? 10);
                    },
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh Balance'),
          ),
        ],
      ),
    );
  }
}
