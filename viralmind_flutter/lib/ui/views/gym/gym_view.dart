import 'package:flutter/material.dart';
import 'package:viralmind_flutter/ui/components/gym/available_tasks.dart';
import 'package:viralmind_flutter/ui/components/gym/recording_history.dart';

class GymView extends StatelessWidget {
  const GymView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: AvailableTasks(),
        ),
        Expanded(
          child: RecordingHistory(),
        ),
      ],
    );
  }
}
