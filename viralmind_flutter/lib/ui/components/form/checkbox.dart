import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final String? label;
  final String variant; // 'dark' ou 'light'
  final EdgeInsetsGeometry? padding;

  const CustomCheckbox({
    super.key,
    this.value,
    this.onChanged,
    this.label = '',
    this.variant = 'dark',
    this.padding,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.value ?? false;
  }

  @override
  void didUpdateWidget(covariant CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value && widget.value != null) {
      _checked = widget.value!;
    }
  }

  Color _labelColor() {
    switch (widget.variant) {
      case 'light':
        return Colors.grey.shade700;
      case 'dark':
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: _checked,
            onChanged: (val) {
              setState(() {
                _checked = val ?? false;
              });
              if (widget.onChanged != null) widget.onChanged!(val);
            },
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          if (widget.label != null && widget.label!.isNotEmpty)
            Flexible(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _checked = !_checked;
                  });
                  if (widget.onChanged != null) widget.onChanged!(_checked);
                },
                child: Text(
                  widget.label!,
                  style: TextStyle(color: _labelColor(), fontSize: 14),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
