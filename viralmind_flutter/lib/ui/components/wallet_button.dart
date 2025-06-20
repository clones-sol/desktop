import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viralmind_flutter/application/connection_token.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/submission/submission_status.dart';
import 'package:viralmind_flutter/utils/format_address.dart';

class WalletButton extends ConsumerStatefulWidget {
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
    this.variant = 'compact',
    this.theme = 'dark',
  });

  final bool isConnected;
  final String? walletAddress;
  final String? nickname;
  final AsyncValue<double>? viralBalance;
  final bool isConnecting;
  final VoidCallback? onConnect;
  final VoidCallback? onDisconnect;
  final VoidCallback? onEditNickname;
  final List<SubmissionStatus> recentSubmissions;
  final String variant;
  final String theme;

  @override
  ConsumerState<WalletButton> createState() => _WalletButtonState();
}

class _WalletButtonState extends ConsumerState<WalletButton> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isHovering = false;

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Future<void> _handleConnect() async {
    final connectionTokenRepository =
        ref.read(connectionTokenRepositoryProvider);
    final url = await connectionTokenRepository.getConnectionUrl();
    if (!mounted) return;

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      // Lance le polling après ouverture de l'URL (comme Svelte)
      await ref.read(connectionTokenNotifierProvider.notifier).startPolling();
      widget.onConnect?.call();
    }
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: 280,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(size.width + 8, -150),
          child: MouseRegion(
            onEnter: (_) {
              setState(() {
                _isHovering = true;
              });
            },
            onExit: (_) {
              setState(() {
                _isHovering = false;
                _hideOverlay();
              });
            },
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF1A1A1A),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Wallet',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          widget.walletAddress?.shortAddress() ?? '',
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Nickname
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nickname',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: widget.onEditNickname,
                          child: Text(
                            widget.nickname ?? 'Set Your Nickname',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: widget.nickname == null
                                  ? Colors.grey
                                  : Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Balance
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Balance',
                          style: TextStyle(color: Colors.grey),
                        ),
                        if (widget.viralBalance != null)
                          widget.viralBalance!.when(
                            data: (balance) => Text(
                              '${balance.toStringAsFixed(2)} \$VIRAL',
                              style: const TextStyle(
                                fontFamily: 'monospace',
                                color: Color(0xFFbb4eff),
                              ),
                            ),
                            loading: () => const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                color: Color(0xFFbb4eff),
                                strokeWidth: 1,
                              ),
                            ),
                            error: (e, _) => const Text('Error'),
                          ),
                      ],
                    ),
                    if (widget.recentSubmissions.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      const Text(
                        'Recent Activity',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      ...widget.recentSubmissions.map(
                        (submission) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.monetization_on,
                                color: Color(0xFFbb4eff),
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      submission.meta.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      submission.createdAt,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '+${submission.reward} \$VIRAL',
                                style: const TextStyle(
                                  color: Color(0xFFbb4eff),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    // Disconnect Button
                    SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                        onPressed: widget.onDisconnect,
                        icon: const Icon(
                          Icons.logout,
                          size: 16,
                          color: Colors.grey,
                        ),
                        label: const Text(
                          'Disconnect Wallet',
                          style: TextStyle(color: Colors.grey),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white.withValues(alpha: 0.05),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isConnected && widget.walletAddress != null) {
      return CompositedTransformTarget(
        link: _layerLink,
        child: LayoutBuilder(
          builder: (context, constraints) {
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: widget.theme == 'light'
                    ? Colors.white.withValues(alpha: 0.9)
                    : Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [
                          VMColors.primary.withValues(alpha: 0.5),
                          VMColors.secondary.withValues(alpha: 0.9),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(
                      'assets/wallet_icon.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  if (widget.variant == 'large') ...[
                    const SizedBox(width: 8),
                    Text(
                      widget.walletAddress?.shortAddress() ?? '',
                      style: TextStyle(
                        color: widget.theme == 'light'
                            ? Colors.black87
                            : Colors.white,
                      ),
                    ),
                  ],
                ],
              ),
            );
            return InkWell(
              onTap: () {
                if (_isHovering == false) {
                  setState(() {
                    _isHovering = true;
                    _showOverlay();
                  });
                } else {
                  setState(() {
                    _isHovering = false;
                    _hideOverlay();
                  });
                }
              },
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [
                      VMColors.primary.withValues(alpha: 0.5),
                      VMColors.secondary.withValues(alpha: 0.9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assets/wallet_icon.png',
                  width: 40,
                  height: 40,
                ),
              ),
            );
          },
        ),
      );
    } else {
      return InkWell(
        onTap: _handleConnect,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [
                VMColors.primary.withValues(alpha: 0.5),
                VMColors.secondary.withValues(alpha: 0.9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset(
            'assets/wallet_icon.png',
            width: 40,
            height: 40,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _hideOverlay();
    super.dispose();
  }
}
