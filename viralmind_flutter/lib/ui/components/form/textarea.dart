import 'package:flutter/material.dart';

class CustomTextArea extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String variant; // 'dark' ou 'light'
  final int minLines;
  final int maxLines;
  final String? hintText;
  final String? labelText;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;

  const CustomTextArea({
    super.key,
    this.initialValue,
    this.onChanged,
    this.variant = 'dark',
    this.minLines = 4,
    this.maxLines = 10,
    this.hintText,
    this.labelText,
    this.padding,
    this.controller,
  });

  @override
  State<CustomTextArea> createState() => _CustomTextAreaState();
}

class _CustomTextAreaState extends State<CustomTextArea> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant CustomTextArea oldWidget) {
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
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          filled: true,
          fillColor: bgColor,
          enabledBorder: _border(borderColor),
          focusedBorder: _border(focusColor),
          border: _border(borderColor),
        ),
      ),
    );
  }
}
