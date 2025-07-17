import 'package:clones/application/session/provider.dart';
import 'package:clones/assets.dart';
import 'package:clones/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones/utils/env.dart';
import 'package:clones/utils/format_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class WalletButton extends ConsumerStatefulWidget {
  const WalletButton({
    super.key,
  });

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
    await ref.read(sessionNotifierProvider.notifier).getConnectionUrl();
    final session = ref.read(sessionNotifierProvider);
    if (!mounted) return;

    final uri = Uri.parse(session.connectionUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      await ref.read(sessionNotifierProvider.notifier).startPolling();
    }
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;
    final session = ref.watch(sessionNotifierProvider);
    final theme = Theme.of(context);
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
              color: Colors.transparent,
              child: Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        blurRadius: 5,
                        offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wallet',
                            style: theme.textTheme.bodyMedium,
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                      text: session.address ?? '',
                                    ),
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Address copied!'),
                                    ),
                                  );
                                },
                                child: Text(
                                  ref
                                          .watch(sessionNotifierProvider)
                                          .address
                                          ?.shortAddress() ??
                                      '',
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                    color: VMColors.primaryText,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  launchUrl(
                                    Uri.parse(
                                      '${Env.solscanBaseUrl}/address/${session.address}',
                                    ),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                child: Icon(
                                  Icons.open_in_new,
                                  color: VMColors.secondaryText,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      if (session.balances != null)
                        ...session.balances!.map(
                          (tokenBalance) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    if (tokenBalance.logoUrl != null)
                                      Image.network(
                                        tokenBalance.logoUrl!,
                                        width: 20,
                                        height: 20,
                                      )
                                    else
                                      const Icon(
                                        Icons.monetization_on_outlined,
                                        size: 20,
                                      ),
                                    const SizedBox(width: 8),
                                    Text(
                                      tokenBalance.name,
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                                if (tokenBalance.isLoading)
                                  const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                else
                                  Text(
                                    '${tokenBalance.balance?.toStringAsFixed(2) ?? 'N/A'} ${tokenBalance.symbol}',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: VMColors.secondary,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(height: 16),
                      BtnPrimary(
                        widthExpanded: true,
                        onTap: ref
                            .read(sessionNotifierProvider.notifier)
                            .cancelConnection,
                        buttonText: 'Disconnect Wallet',
                      ),
                    ],
                  ),
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
    final session = ref.watch(sessionNotifierProvider);

    if (session.isConnected) {
      return CompositedTransformTarget(
        link: _layerLink,
        child: LayoutBuilder(
          builder: (context, constraints) {
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
                  Assets.walletConnectedIcon,
                  width: 50,
                  height: 50,
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
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                Assets.walletToConnectIcon,
                width: 50,
                height: 50,
              ),
            ],
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
