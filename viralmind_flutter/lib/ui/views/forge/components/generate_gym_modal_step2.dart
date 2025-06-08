import 'package:flutter/material.dart';

class GenerateGymModalStep2 extends StatelessWidget {
  const GenerateGymModalStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 60),
        Center(child: CircularProgressIndicator()),
        SizedBox(height: 24),
        Center(
          child: Text('Generating your gym...', style: TextStyle(fontSize: 16)),
        ),
        SizedBox(height: 8),
        Center(
          child: Text(
            'Creating tasks based on your requirements...',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(height: 60),
      ],
    );
  }
}
