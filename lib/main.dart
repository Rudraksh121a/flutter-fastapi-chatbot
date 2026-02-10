import 'package:chatbot/pages/home_page.dart';
import 'package:chatbot/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.submitButton),
      ),
      home: Scaffold(body: MyApp()),
    );
  }
}
