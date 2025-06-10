import 'package:flutter/material.dart';
import 'package:viralmind_flutter/ui/components/checkbox/checkbox_custom.dart';

class CheckboxConfirm extends StatelessWidget {
  const CheckboxConfirm({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  final bool value;
  final void Function(bool value) onChanged;
  final Widget text;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => onChanged(!value),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxCustom(
              value: value,
              onChanged: onChanged,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 1),
                child: text,
              ),
            ),
          ],
        ),
      );
}
