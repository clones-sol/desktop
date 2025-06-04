import 'package:flutter/material.dart';

class WalletButton extends StatelessWidget {
  final bool isConnected;
  final String? walletAddress;
  final String? nickname;
  final double? viralBalance;
  final bool isConnecting;
  final VoidCallback? onConnect;
  final VoidCallback? onDisconnect;
  final VoidCallback? onEditNickname;
  final List<SubmissionStatus> recentSubmissions;

  const WalletButton({
    super.key,
    required this.isConnected,
    this.walletAddress,
    this.nickname,
    this.viralBalance,
    this.isConnecting = false,
    this.onConnect,
    this.onDisconnect,
    this.onEditNickname,
    this.recentSubmissions = const [],
  });

  String formatNumber(double? num) {
    if (num == null) return '0.00';
    return num.toStringAsFixed(2);
  }

  String shortAddress(String? address) {
    if (address == null || address.length < 8) return address ?? '';
    return '${address.substring(0, 4)}...${address.substring(address.length - 4)}';
  }

  @override
  Widget build(BuildContext context) {
    if (isConnected && walletAddress != null) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: PopupMenuButton<int>(
          tooltip: 'Wallet',
          offset: const Offset(0, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          itemBuilder:
              (context) => [
                PopupMenuItem(
                  enabled: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Wallet',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        shortAddress(walletAddress),
                        style: const TextStyle(fontFamily: 'monospace'),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Nickname',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: onEditNickname,
                        child: Text(
                          nickname ?? 'Set Your Nickname',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                nickname == null ? Colors.grey : Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  enabled: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Balance',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '${formatNumber(viralBalance)} \$VIRAL',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFbb4eff),
                        ),
                      ),
                    ],
                  ),
                ),
                if (recentSubmissions.isNotEmpty)
                  PopupMenuItem(
                    enabled: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Recent Activity',
                          style: TextStyle(color: Colors.grey),
                        ),
                        ...recentSubmissions.map(
                          (submission) => ListTile(
                            dense: true,
                            leading: const Icon(
                              Icons.monetization_on,
                              color: Color(0xFFbb4eff),
                              size: 18,
                            ),
                            title: Text(
                              submission.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              submission.date,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            trailing: Text(
                              '+${submission.reward} \$VIRAL',
                              style: const TextStyle(
                                color: Color(0xFFbb4eff),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            onTap: () {
                              // TODO: open Solscan link
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: onDisconnect,
                    icon: const Icon(
                      Icons.logout,
                      size: 16,
                      color: Colors.grey,
                    ),
                    label: const Text(
                      'Disconnect Wallet',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.account_balance_wallet,
                  size: 18,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  shortAddress(walletAddress),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return ElevatedButton.icon(
        onPressed: onConnect,
        icon: const Icon(Icons.account_balance_wallet, size: 18),
        label: Text(isConnecting ? 'Connecting...' : 'Connect Wallet'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.05),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      );
    }
  }
}

// Dummy SubmissionStatus class for structure
class SubmissionStatus {
  final String title;
  final String date;
  final double reward;
  final String solscanUrl;

  SubmissionStatus({
    required this.title,
    required this.date,
    required this.reward,
    required this.solscanUrl,
  });
}
