import 'dart:async';
import 'package:flutter/material.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';

class CountdownButton extends StatefulWidget {
  const CountdownButton({
    super.key,
    required this.onStart,
    required this.onCancel,
    required this.disabled,
  });
  final VoidCallback onStart;
  final VoidCallback onCancel;
  final bool Function() disabled;

  @override
  State<CountdownButton> createState() => _CountdownButtonState();
}

class _CountdownButtonState extends State<CountdownButton> {
  bool countingDown = false;
  int countdown = 3;
  Timer? countdownTimer;

  void startCountdown() {
    if (countingDown || widget.disabled()) return;

    setState(() {
      countingDown = true;
      countdown = 3;
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (countdown == 0) {
          timer.cancel();
          countingDown = false;
          widget.onStart();
        }
      });
    });
  }

  void cancelCountdown() {
    if (countdownTimer != null) {
      countdownTimer!.cancel();
      countdownTimer = null;
      setState(() {
        countingDown = false;
        countdown = 3;
      });
      widget.onCancel();
    }
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = widget.disabled();

    return BtnPrimary(
      onTap: isDisabled
          ? null
          : countingDown
              ? cancelCountdown
              : startCountdown,
      buttonText:
          countingDown ? 'Cancel ($countdown s)' : 'Start Recording Quest',
      btnPrimaryType:
          countingDown ? BtnPrimaryType.dark : BtnPrimaryType.primary,
      isLocked: isDisabled,
      icon: Icons.videocam,
    );
  }
}
