import 'package:flutter/material.dart';

class GymView extends StatelessWidget {
  const GymView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Gym View',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
