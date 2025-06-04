import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String variant; // 'dark' ou 'light'
  final Widget? icon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? labelText;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    this.initialValue,
    this.onChanged,
    this.variant = 'dark',
    this.icon,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.labelText,
    this.padding,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue &&
        widget.initialValue != _controller.text) {
      _controller.text = widget.initialValue ?? '';
    }
  }

  InputBorder _border(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.variant == 'dark';

    final bgColor = isDark ? Colors.grey[850] : Colors.grey[200];
    final textColor = isDark ? Colors.white : Colors.black;
    final borderColor = isDark ? Colors.grey[700]! : Colors.grey[300]!;

    final focusColor = Theme.of(context).colorScheme.secondary;

    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          filled: true,
          fillColor: bgColor,
          prefixIcon:
              widget.icon != null
                  ? Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.grey[400]),
                      child: widget.icon!,
                    ),
                  )
                  : null,
          contentPadding:
              widget.icon != null
                  ? const EdgeInsets.symmetric(vertical: 14, horizontal: 0)
                  : const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          enabledBorder: _border(borderColor),
          focusedBorder: _border(focusColor),
          border: _border(borderColor),
        ),
      ),
    );
  }
}
