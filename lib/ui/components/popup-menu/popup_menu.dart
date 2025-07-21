import 'package:flutter/material.dart';

class ContextMenu extends StatefulWidget {
  const ContextMenu({
    super.key,
    required this.open,
    required this.position,
    this.onClose,
    required this.child,
  });
  final bool open;
  final Offset position;
  final VoidCallback? onClose;
  final Widget child;

  @override
  ContextMenuState createState() => ContextMenuState();
}

class ContextMenuState extends State<ContextMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    if (widget.open) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(ContextMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.open && !oldWidget.open) {
      _controller.forward();
    } else if (!widget.open && oldWidget.open) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapOutside() {
    if (widget.open && widget.onClose != null) {
      widget.onClose!();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.open && _controller.status == AnimationStatus.dismissed) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        // Detect taps outside to close
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _handleTapOutside,
            child: Container(),
          ),
        ),
        Positioned(
          top: widget.position.dy,
          left: widget.position.dx,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                constraints: const BoxConstraints(minWidth: 150),
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
