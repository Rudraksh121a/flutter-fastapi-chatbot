import 'dart:convert';

import 'package:web_socket_client/web_socket_client.dart';

class ChatWebServices {
  static final ChatWebServices _instance = ChatWebServices._internal();
  factory ChatWebServices() => _instance;
  ChatWebServices._internal();

  WebSocket? _socket;
  bool _isConnected = false;
  void Function(String message)? onMessage;

  void connect() {
    if (_isConnected) return;
    _socket = WebSocket(Uri.parse("ws://localhost:8002/ws/chat/"));
    _socket!.messages.listen(
      (message) {
        final data = json.decode(message);
        final msg = data['message']?.toString() ?? message;
        print(msg);
        if (onMessage != null) {
          onMessage!(msg);
        }
      },
      onDone: () {
        _isConnected = false;
        _socket = null;
      },
      onError: (error) {
        _isConnected = false;
        _socket = null;
        print('WebSocket error: $error');
      },
    );
    _isConnected = true;
  }

  void chat(String query) {
    if (_socket == null) {
      connect();
    }
    if (_socket != null) {
      _socket!.send(json.encode({"message": query}));
    } else {
      print("WebSocket is not connected.");
    }
  }
}
