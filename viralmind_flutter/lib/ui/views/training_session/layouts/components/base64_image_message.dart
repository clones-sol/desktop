import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viralmind_flutter/ui/components/design_widget/message_box/message_box.dart';
import 'package:viralmind_flutter/ui/components/pfp.dart';

class Base64ImageMessage extends StatefulWidget {
  const Base64ImageMessage({super.key, required this.base64});
  final String base64;

  @override
  State<Base64ImageMessage> createState() => _Base64ImageMessageState();
}

class _Base64ImageMessageState extends State<Base64ImageMessage>
    with AutomaticKeepAliveClientMixin {
  late Future<Uint8List> _decodedImageFuture;

  @override
  void initState() {
    super.initState();
    _decodedImageFuture = _decodeImage(widget.base64);
  }

  @override
  bool get wantKeepAlive {
    return true;
  }

  Future<Uint8List> _decodeImage(String base64) async {
    return base64Decode(base64);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Pfp(),
        const SizedBox(width: 8),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: MessageBox(
            messageBoxType: MessageBoxType.talkLeft,
            content: FutureBuilder<Uint8List>(
              future: _decodedImageFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Image.memory(
                    snapshot.data!,
                    gaplessPlayback: true,
                  );
                } else {
                  return const Center(
                    child: SizedBox(
                      height: 32,
                      width: 32,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
