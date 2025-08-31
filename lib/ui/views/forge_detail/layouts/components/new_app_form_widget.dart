import 'package:clones_desktop/ui/views/forge_detail/bloc/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewAppFormWidget extends ConsumerStatefulWidget {
  const NewAppFormWidget({super.key});

  @override
  ConsumerState<NewAppFormWidget> createState() => _NewAppFormWidgetState();
}

class _NewAppFormWidgetState extends ConsumerState<NewAppFormWidget> {
  String newAppName = '';
  String newAppDomain = '';

  @override
  Widget build(BuildContext context) {
    final forgeDetail = ref.watch(forgeDetailNotifierProvider);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'App name'),
            onChanged: (v) => setState(() => newAppName = v),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Domain (optional)',
            ),
            onChanged: (v) => setState(() => newAppDomain = v),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  ref.read(forgeDetailNotifierProvider.notifier)
                    ..setShowNewAppForm(false)
                    ..setNewAppName('')
                    ..setNewAppDomain('');
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: forgeDetail.newAppName == null ||
                        forgeDetail.newAppName!.isEmpty
                    ? null
                    : () => ref
                        .read(forgeDetailNotifierProvider.notifier)
                        .createApp(),
                child: const Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
