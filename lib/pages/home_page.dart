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
          Column(
            children: [
              //search section
              //footer
            ],
          ),
        ],
      ),
    );
  }
}
