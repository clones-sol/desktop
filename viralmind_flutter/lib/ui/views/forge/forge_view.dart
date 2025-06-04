import 'package:flutter/material.dart';

class ForgeView extends StatelessWidget {
  const ForgeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Forge View',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
