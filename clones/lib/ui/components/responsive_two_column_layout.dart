import 'package:clones/utils/breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveTwoColumnLayout extends StatelessWidget {
  const ResponsiveTwoColumnLayout({
    super.key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Breakpoints.mobile) {
          return Row(
            crossAxisAlignment: crossAxisAlignment,
            children: [
              Expanded(child: children[0]),
              const SizedBox(width: 24),
              Expanded(child: children[1]),
            ],
          );
        } else {
          return Column(
            children: [
              children[0],
              const SizedBox(height: 24),
              children[1],
            ],
          );
        }
      },
    );
  }
}
