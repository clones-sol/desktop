import 'package:flutter/material.dart';
import 'package:viralmind_flutter/assets.dart';

class GenerateGymModalStep2 extends StatelessWidget {
  const GenerateGymModalStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: CircularProgressIndicator()),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'Generating your gym...',
            style: TextStyle(color: VMColors.primaryText, fontSize: 16),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Creating tasks based on your requirements...',
            style: TextStyle(color: VMColors.secondaryText),
          ),
        ),
      ],
    );
  }
}
