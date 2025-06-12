import 'package:flutter/material.dart';
import 'package:viralmind_flutter/domain/models/quest/quest_reward.dart';
import 'package:viralmind_flutter/ui/components/buttons/btn_primary.dart';

class QuestPanel extends StatelessWidget {
  const QuestPanel({
    super.key,
    required this.title,
    this.reward,
    required this.objectives,
    required this.onStartRecording,
    required this.onComplete,
    required this.onGiveUp,
  });

  final String title;
  final QuestReward? reward;
  final List<String> objectives;
  final Function(int fps) onStartRecording;
  final VoidCallback onComplete;
  final VoidCallback onGiveUp;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            if (reward != null)
              Text(
                'Reward: ${reward!.maxReward} \$VIRAL',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            const SizedBox(height: 10),
            ...objectives.map((obj) => Text('- $obj')),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BtnPrimary(
                  buttonText: 'Give Up',
                  onTap: onGiveUp,
                  btnPrimaryType: BtnPrimaryType.outlinePrimary,
                ),
                BtnPrimary(
                  buttonText: 'Start Recording',
                  onTap: () => onStartRecording(60),
                ),
                BtnPrimary(
                  buttonText: 'Complete',
                  onTap: onComplete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
