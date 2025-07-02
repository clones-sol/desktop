import 'package:flutter/material.dart';

class Assets {
  static const String assetFolder = 'assets/';
  static const String assetIconsFolder = '${assetFolder}icons/';

  static const String logoIcon = '${assetFolder}Logo_Icon.png';
  static const String background = '${assetFolder}main-background.png';

  // Icons
  static const String forgeIcon = '${assetIconsFolder}forge_icon.png';
  static const String gymIcon = '${assetIconsFolder}gym_icon.png';
  static const String gymHistoryIcon =
      '${assetIconsFolder}gym_history_icon.png';
  static const String gymAddIcon = '${assetIconsFolder}add_gym_icon.png';
  static const String statsIcon = '${assetIconsFolder}stats_icon.png';
  static const String skillsTreeIcon =
      '${assetIconsFolder}skills_tree_icon.png';
  static const String walletToConnectIcon =
      '${assetIconsFolder}wallet_to_connect_icon.png';
  static const String walletToConnectIconWB =
      '${assetIconsFolder}wallet_to_connect_wb_icon.png';
  static const String walletConnectedIcon =
      '${assetIconsFolder}wallet_connected_icon.png';
  static const String deleteIcon = '${assetIconsFolder}delete_icon.png';
  static const String editIcon = '${assetIconsFolder}edit_icon.png';
  static const String hubIcon = '${assetIconsFolder}hub_icon.png';
  static const String recordIcon = '${assetIconsFolder}record_icon.png';
  static const String uploadIcon = '${assetIconsFolder}upload_icon.png';
  static const String robotIcon = '${assetIconsFolder}robot_icon.png';
}

class VMColors {
  static const Color primaryText = Colors.white;
  static Color secondaryText = Colors.white.withValues(alpha: 0.6);
  static Color tertiaryText = Colors.black.withValues(alpha: 0.9);
  static const Color primary = Color(0xFFC34EFF);
  static const Color secondary = Color(0xFF9050FF);
  static const Color tertiary = Color(0xFF5C51FF);

  static const Color rewardInfo = Color(0xFF10B981);
  static const Color uploadLimit = Color.fromARGB(255, 203, 132, 46);

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

  static const Color containerIcon1 = Color(0xFFF472B6);
  static const Color containerIcon2 = Color(0xFF22D3EE);
  static const Color containerIcon3 = Color(0xFFFB923C);
  static const Color containerIcon4 = Color(0xFF4ADE80);
  static const Color containerIcon5 = Color(0xFF8B5CF6);
  static const Color containerIcon6 = Color(0xFFEC4899);
}
