import 'dart:async';
import 'dart:convert';
import 'package:clones/domain/models/agent/agent_socket_message.dart';
import 'package:clones/utils/env.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AgentSocketService {
  WebSocketChannel? _channel;
  StreamController<AgentSocketMessage>? _controller;
  String? _token;
  Timer? _reconnectTimer;
  final _subscribedTopics = <String>{};

  Stream<AgentSocketMessage> get messages {
    _controller ??= StreamController<AgentSocketMessage>.broadcast();
    return _controller!.stream;
  }

  void connect(String token) {
    if (_channel != null && _token == token) {
      // Already connected with the same token
      return;
    }

    _token = token;
    final httpUrl = Env.apiBackendUrl;
    final wsUrl = httpUrl.replaceFirst(RegExp(r'^http'), 'ws');
    final uri = Uri.parse('$wsUrl?token=$token');
    _channel = IOWebSocketChannel.connect(uri);

    _channel!.stream.listen(
      (data) {
        if (_controller?.hasListener ?? false) {
          try {
            final json = jsonDecode(data as String);
            _controller!.add(AgentSocketMessage.fromJson(json));
          } catch (e) {
            _controller!.add(
                AgentSocketMessage.error(error: 'Failed to parse message: $e'));
          }
        }
      },
      onDone: () => _handleDisconnect(),
      onError: (error) {
        if (_controller?.hasListener ?? false) {
          _controller!.add(AgentSocketMessage.error(error: error.toString()));
        }
        _handleDisconnect();
      },
    );
  }

  void subscribe(String agentId) {
    if (_channel == null) {
      throw Exception('Not connected to WebSocket');
    }
    final message = jsonEncode({'type': 'subscribe', 'topic': agentId});
    _channel!.sink.add(message);
    _subscribedTopics.add(agentId);
  }

  void unsubscribe(String agentId) {
    if (_channel == null) return;
    final message = jsonEncode({'type': 'unsubscribe', 'topic': agentId});
    _channel!.sink.add(message);
    _subscribedTopics.remove(agentId);
  }

  void _handleDisconnect() {
    _channel = null;
    // Attempt to reconnect after a delay
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 5), () {
      if (_token != null) {
        connect(_token!);
        // Resubscribe to all previously subscribed topics
        for (final topic in _subscribedTopics) {
          subscribe(topic);
        }
      }
    });
  }

  void dispose() {
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    _controller?.close();
  }
}
