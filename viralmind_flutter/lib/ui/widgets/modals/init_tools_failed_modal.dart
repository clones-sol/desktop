import 'package:flutter/material.dart';

class InitToolsFailedModal extends StatelessWidget {
  final List<String> errors;
  final VoidCallback retry;

  const InitToolsFailedModal({
    super.key,
    required this.errors,
    required this.retry,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tool Initialization Failed'),
      content: SingleChildScrollView(
        child: ListBody(
          children: errors.map((error) => Text(error)).toList(),
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
          child: const Text('Retry'),
          onPressed: retry,
        ),
      ],
    );
  }
}
