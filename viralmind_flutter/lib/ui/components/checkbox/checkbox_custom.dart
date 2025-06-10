import 'package:flutter/material.dart';
import 'package:viralmind_flutter/assets.dart';

class CheckboxCustom extends StatelessWidget {
  const CheckboxCustom({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final bool value;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onChanged(!value),
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: const HSLColor.fromAHSL(1, 0, 0, 1)
                  .toColor()
                  .withValues(alpha: 0.8),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: value
              ? Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    gradient: VMColors.gradientInputFormBackground,
                    border: Border.all(
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
