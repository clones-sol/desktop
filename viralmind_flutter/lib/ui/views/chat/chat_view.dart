import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Chat View',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
