import 'package:flutter/material.dart';

class Assets {
  static const String logoIcon = 'assets/Logo_Icon.png';
  static const String background = 'assets/main-background.png';
  static const String forgeIcon = 'assets/forge_icon.png';
  static const String gymIcon = 'assets/gym_icon.png';
  static const String gymHistoryIcon = 'assets/gym_history_icon.png';
  static const String gymAddIcon = 'assets/add_gym_icon.png';
  static const String statsIcon = 'assets/stats_icon.png';
  static const String skillsTreeIcon = 'assets/skills_tree_icon.png';
  static const String walletIcon = 'assets/wallet_icon.png';
}

class VMColors {
  static const Color primaryText = Colors.white;
  static Color secondaryText = Colors.white.withValues(alpha: 0.6);
  static Color tertiaryText = Colors.black.withValues(alpha: 0.9);
  static const Color primary = Color(0xFFC34EFF);
  static const Color secondary = Color(0xFF9050FF);
  static const Color tertiary = Color(0xFF5C51FF);

  static const Color rewardInfo = Color(0xFF10B981);

  static Gradient gradientBtnPrimary = const LinearGradient(
    colors: [
      Color(0xFFA855F6),
      Color(0xFFEB489A),
    ],
  );

  static Gradient gradientInputFormBackground = LinearGradient(
    colors: [
      const HSLColor.fromAHSL(1, 0, 0, 0.10).toColor().withValues(alpha: 1),
      const HSLColor.fromAHSL(1, 0, 0, 0.10).toColor().withValues(alpha: 0.3),
    ],
    stops: const [0, 1],
  );
}
