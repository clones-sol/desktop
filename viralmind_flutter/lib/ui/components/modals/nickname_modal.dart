import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NicknameModal extends StatefulWidget {
  const NicknameModal({super.key, this.oldNick, required this.onSave});
  final String? oldNick;
  final Function(String) onSave;

  @override
  State<NicknameModal> createState() => _NicknameModalState();
}

class _NicknameModalState extends State<NicknameModal> {
  late TextEditingController _controller;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.oldNick);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSave() {
    final nickname = _controller.text.trim();
    if (nickname.isEmpty) {
      setState(() {
        _error = 'Nickname cannot be empty';
      });
      return;
    }
    if (nickname.length > 25) {
      setState(() {
        _error = 'Nickname must be less than 25 characters';
      });
      return;
    }
    widget.onSave(nickname);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Set Nickname',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Set your nickname to be displayed on the demonstrator leaderboard.',
              style: TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 8),
            const Text(
              'Maximum length of 25 characters. Make it memorable!',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nickname',
                hintText: 'JohnDoe23',
                errorText: _error,
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
              maxLength: 25,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => context.pop(),
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _handleSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
