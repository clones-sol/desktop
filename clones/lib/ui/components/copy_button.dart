import 'package:flutter/material.dart';

class CopyButton extends StatefulWidget {
  const CopyButton({super.key, required this.content});
  final String content;

  @override
  State<CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<CopyButton> {
  bool copied = false;

  void copyToClipboard() {
    try {
      // TODO(reddwarf03): Fix it
      //writeText(widget.content);
      setState(() {
        copied = true;
      });
      Future.delayed(const Duration(milliseconds: 750), () {
        if (mounted) {
          setState(() {
            copied = false;
          });
        }
      });
    } catch (e) {
      debugPrint('Error copying to clipboard: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade300,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          textStyle: const TextStyle(fontSize: 14),
        ),
        onPressed: copyToClipboard,
        child: Text(copied ? 'Copied!' : 'Copy'),
      ),
    );
  }
}
