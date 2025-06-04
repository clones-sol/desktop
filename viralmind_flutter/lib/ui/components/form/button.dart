import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum ButtonVariant { primary, destroy, warning, secondary, green }

enum ButtonBehavior { invert, none }

class CustomButton extends StatelessWidget {
  final String? href;
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonVariant variant;
  final ButtonBehavior behavior;
  final ButtonStyle? style;
  final bool disabled;

  const CustomButton({
    super.key,
    this.href,
    this.onPressed,
    required this.child,
    this.variant = ButtonVariant.primary,
    this.behavior = ButtonBehavior.invert,
    this.style,
    this.disabled = false,
  });

  Color _backgroundColor() {
    if (behavior == ButtonBehavior.invert) {
      switch (variant) {
        case ButtonVariant.primary:
          return Colors.teal.shade700;
        case ButtonVariant.green:
          return Colors.green.shade700;
        case ButtonVariant.secondary:
          return Colors.grey.shade300;
        case ButtonVariant.warning:
          return Colors.yellow.shade700;
        case ButtonVariant.destroy:
          return Colors.red.shade700;
      }
    } else {
      switch (variant) {
        case ButtonVariant.primary:
          return Colors.teal.shade700;
        case ButtonVariant.green:
          return Colors.green.shade700;
        case ButtonVariant.secondary:
          return Colors.grey.shade300;
        case ButtonVariant.warning:
          return Colors.yellow.shade700;
        case ButtonVariant.destroy:
          return Colors.red.shade700;
      }
    }
  }

  Color _textColor() {
    if (behavior == ButtonBehavior.invert) {
      switch (variant) {
        case ButtonVariant.primary:
        case ButtonVariant.green:
        case ButtonVariant.warning:
        case ButtonVariant.destroy:
          return Colors.white;
        case ButtonVariant.secondary:
          return Colors.black87;
      }
    } else {
      switch (variant) {
        case ButtonVariant.primary:
        case ButtonVariant.green:
        case ButtonVariant.warning:
        case ButtonVariant.destroy:
          return Colors.white;
        case ButtonVariant.secondary:
          return Colors.black87;
      }
    }
  }

  Color _borderColor() {
    if (behavior == ButtonBehavior.invert) {
      switch (variant) {
        case ButtonVariant.primary:
          return Colors.teal.shade700;
        case ButtonVariant.green:
          return Colors.green.shade700;
        case ButtonVariant.secondary:
          return Colors.grey.shade300;
        case ButtonVariant.warning:
          return Colors.yellow.shade600;
        case ButtonVariant.destroy:
          return Colors.red.shade700;
      }
    } else {
      return Colors.transparent;
    }
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    final bg = _backgroundColor();
    final fg = _textColor();
    final border = _borderColor();

    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (disabled) return Colors.grey.shade300;
        if (states.contains(WidgetState.hovered) &&
            behavior == ButtonBehavior.invert) {
          return Colors.white;
        } else if (states.contains(WidgetState.hovered)) {
          return bg.withValues(alpha: 0.8);
        }
        return bg;
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (disabled) return Colors.white70;
        if (states.contains(WidgetState.hovered) &&
            behavior == ButtonBehavior.invert) {
          return border;
        }
        return fg;
      }),
      side: WidgetStateProperty.all(BorderSide(color: border)),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      overlayColor: WidgetStateProperty.all(Colors.black12),
    );
  }

  Future<void> _handleTap() async {
    if (disabled) return;
    if (href != null) {
      final uri = Uri.tryParse(href!);
      if (uri != null && await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    } else {
      if (onPressed != null) onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: disabled ? null : _handleTap,
      style: style ?? _buttonStyle(context),
      child: child,
    );

    if (href != null) {
      return button;
    } else {
      return button;
    }
  }
}
