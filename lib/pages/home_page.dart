import 'package:chatbot/theme/colors.dart';
import 'package:chatbot/widgets/search_section.dart';
import 'package:chatbot/widgets/side_bar.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Column(children: [Expanded(child: SearchSection())]),
          ),
        ],
      ),
    );
  }
}
