import 'dart:convert';
import 'package:chatbot/services/chat_web_services.dart';
import 'package:chatbot/theme/colors.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    ChatWebServices().onMessage = (msg) {
      // Try to parse JSON and extract 'response' field
      String displayMsg = msg;
      try {
        final data = json.decode(msg);
        if (data is Map && data.containsKey('response')) {
          displayMsg = data['response'].toString();
        }
      } catch (_) {}
      setState(() {
        _messages.add({"role": "bot", "text": displayMsg});
        isLoading = false;
      });
    };
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty || isLoading) return;
    setState(() {
      _messages.add({"role": "user", "text": text});
      isLoading = true;
      _controller.clear();
    });
    ChatWebServices().chat(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg["role"] == "user";
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: isUser
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (!isUser)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, top: 2),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.submitButton,
                          child: Icon(
                            Icons.smart_toy,
                            color: AppColors.background,
                            size: 18,
                          ),
                        ),
                      ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: isUser
                              ? AppColors.submitButton.withOpacity(0.9)
                              : AppColors.cardColor.withOpacity(0.95),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(isUser ? 16 : 4),
                            bottomRight: Radius.circular(isUser ? 4 : 16),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          msg["text"] ?? '',
                          style: TextStyle(
                            color: isUser
                                ? AppColors.background
                                : AppColors.whiteColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    if (isUser)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 2),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.iconGrey,
                          child: Icon(
                            Icons.person,
                            color: AppColors.background,
                            size: 18,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          Divider(height: 1, color: AppColors.searchBarBorder),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (_) => _sendMessage(),
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.submitButton,
                            ),
                          ),
                        )
                      : Icon(Icons.send, color: AppColors.submitButton),
                  onPressed: isLoading ? null : _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
