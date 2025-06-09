import 'package:flutter/material.dart';

class InitToolsFailedModal extends StatelessWidget {
  const InitToolsFailedModal({
    super.key,
    required this.errors,
    required this.retry,
  });
  final List<String> errors;
  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tool Initialization Failed'),
      content: SingleChildScrollView(
        child: ListBody(
          children: errors.map(Text.new).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Ignore'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FilledButton(
          onPressed: retry,
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
