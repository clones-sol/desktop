import 'package:flutter/material.dart';

class LeaderboardsView extends StatelessWidget {
  const LeaderboardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Leaderboards View',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
