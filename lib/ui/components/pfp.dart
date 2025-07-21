import 'package:clones_desktop/assets.dart';
import 'package:flutter/material.dart';

class Pfp extends StatelessWidget {
  const Pfp({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: VMColors.primaryText.withValues(alpha: 0.1),
      child: Image.asset(
        Assets.robotIcon,
        width: 24,
        height: 24,
      ),
    );
  }
}
