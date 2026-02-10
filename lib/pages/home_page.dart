import 'package:chatbot/services/chat_web_services.dart';
import 'package:chatbot/theme/colors.dart';
import 'package:chatbot/pages/chat_page.dart';
import 'package:chatbot/widgets/side_bar.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChatWebServices().connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Column(children: [Expanded(child: ChatPage())]),
          ),
        ],
      ),
    );
  }
}
