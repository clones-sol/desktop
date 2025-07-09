import 'dart:async';

import 'package:clones/ui/components/design_widget/message_box/message_box.dart';
import 'package:clones/ui/components/pfp.dart';
import 'package:flutter/material.dart';

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator> {
  int _dotCount = 1;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      if (mounted) {
        setState(() {
          _dotCount = (_dotCount % 3) + 1;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: MessageBox(
              messageBoxType: MessageBoxType.talkLeft,
              content: Text(
                '.' * _dotCount + ' ' * (3 - _dotCount),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const Positioned(
            left: 0,
            top: 0,
            child: Pfp(),
          ),
        ],
      ),
    );
  }
}
