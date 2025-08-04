import 'package:flutter/material.dart';

enum MessageBoxType { success, warning, locked, info, talkLeft, talkRight }

class MessageBox extends StatelessWidget {
  const MessageBox({
    super.key,
    required this.messageBoxType,
    required this.content,
    this.onTap,
  });

  factory MessageBox.withRichText({
    Key? key,
    required MessageBoxType messageBoxType,
    required List<TextSpan> text,
    VoidCallback? onTap,
  }) =>
      MessageBox(
        key: key,
        messageBoxType: messageBoxType,
        onTap: onTap,
        content: Text.rich(TextSpan(children: text)),
      );

  final MessageBoxType messageBoxType;
  final Widget content;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: _getCardColor(messageBoxType),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: _getBorderColor(messageBoxType),
          width: 0.5,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: (messageBoxType == MessageBoxType.talkLeft ||
                  messageBoxType == MessageBoxType.talkRight)
              ? content
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: messageBoxType == MessageBoxType.talkRight
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    if (_getLeadingIcon(messageBoxType) != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: _getLeadingIcon(messageBoxType) ??
                            const SizedBox.shrink(),
                      ),
                      const SizedBox(width: 12),
                    ],
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: content,
                      ),
                    ),
                    if (onTap != null &&
                        messageBoxType != MessageBoxType.locked)
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 14,
                      ),
                  ],
                ),
        ),
      ),
    );
  }

  Color _getCardColor(MessageBoxType messageBoxType) {
    switch (messageBoxType) {
      case MessageBoxType.success:
        return const Color(0xFF00B67A).withOpacity(0.1);
      case MessageBoxType.warning:
        return const Color(0xFFFF8400).withOpacity(0.2);
      case MessageBoxType.locked:
        return const Color(0xFF262626);
      case MessageBoxType.info:
        return const Color(0xFF5540BF).withOpacity(0.2);
      case MessageBoxType.talkLeft:
        return const Color.fromARGB(255, 140, 122, 228).withOpacity(0.2);
      case MessageBoxType.talkRight:
        return const Color.fromARGB(255, 49, 27, 163).withOpacity(0.2);
    }
  }

  Color _getBorderColor(MessageBoxType messageBoxType) {
    switch (messageBoxType) {
      case MessageBoxType.success:
        return const Color(0xFF00B67A);
      case MessageBoxType.warning:
        return const Color(0xFFFF8400);
      case MessageBoxType.locked:
        return const Color(0xFF343434);
      case MessageBoxType.info:
        return const Color(0xFF5540BF);
      case MessageBoxType.talkLeft:
        return const Color.fromARGB(255, 140, 122, 228);
      case MessageBoxType.talkRight:
        return const Color.fromARGB(255, 49, 27, 163);
    }
  }

  Widget? _getLeadingIcon(MessageBoxType messageBoxType) {
    switch (messageBoxType) {
      case MessageBoxType.success:
        return const Icon(Icons.done_all, color: Colors.white, size: 16);
      case MessageBoxType.warning:
        return const Icon(
          Icons.warning_amber,
          color: Color(0xFFFF8400),
          size: 16,
        );
      case MessageBoxType.locked:
        return const Opacity(
          opacity: 0.8,
          child: Icon(
            Icons.lock_outline,
            color: Color(0xFFFFFFFF),
            size: 16,
          ),
        );
      case MessageBoxType.info:
        return const Opacity(
          opacity: 0.8,
          child: Icon(
            Icons.info_outlined,
            color: Color(0xFFFFFFFF),
            size: 16,
          ),
        );
      case MessageBoxType.talkLeft:
      case MessageBoxType.talkRight:
        return null;
    }
  }
}
