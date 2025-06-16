import 'package:flutter/material.dart';

class Pfp extends StatelessWidget {
  const Pfp({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder for the PFP widget from the Svelte code
    return const CircleAvatar(
      // In the svelte code, it's an image: <img src={pfp} ...>
      // I'll use a placeholder icon for now.
      child: Icon(Icons.person),
    );
  }
}
