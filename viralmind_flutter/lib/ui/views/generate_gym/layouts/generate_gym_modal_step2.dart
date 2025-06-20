import 'package:flutter/material.dart';

class GenerateGymModalStep2 extends StatelessWidget {
  const GenerateGymModalStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: CircularProgressIndicator(strokeWidth: 1)),
        const SizedBox(height: 20),
        Center(
          child: Text(
            'Generating your gym...',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Creating tasks based on your requirements...',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
