import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgCardWidget extends StatelessWidget {
  const SvgCardWidget({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final rotationAngle = random.nextDouble() * 2 * pi;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Transform.rotate(
            angle: rotationAngle,
            child: SvgPicture.asset(
              'assets/Logo-Circle-Transparent.svg',
              width: width,
              height: height,
              colorFilter: const ColorFilter.mode(
                Color(0xFF6366F1),
                BlendMode.srcIn,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
