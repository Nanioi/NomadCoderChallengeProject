import 'package:day11practiceproject/core/theme/constant/app_colors.dart';
import 'package:day11practiceproject/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.colorRed,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: AppColors.colorBlue,
          ),
        ),
        cardColor: AppColors.colorWhite,
      ),
      home: const HomeScreen(),
    );
  }
}
