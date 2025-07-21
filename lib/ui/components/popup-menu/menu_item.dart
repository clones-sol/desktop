import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    this.icon,
    this.danger = false,
    this.onTap,
    required this.child,
  });
  final Widget? icon;
  final bool danger;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final baseTextColor = danger ? Colors.red[600] : Colors.grey[800];
    final hoverColor = danger ? Colors.red[50] : Colors.grey[100];

    return InkWell(
      onTap: onTap,
      hoverColor: hoverColor,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            if (icon != null) ...[
              SizedBox(width: 16, height: 16, child: icon),
              const SizedBox(width: 8),
            ],
            DefaultTextStyle(
              style: TextStyle(color: baseTextColor),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
