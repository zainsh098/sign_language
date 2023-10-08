import 'package:flutter/material.dart';
import 'package:sign_language/screens/bottom_sheet/bottom_sheet.dart';
import 'package:sign_language/screens/home_screen.dart';
import 'package:sign_language/screens/on_boarding_screen.dart';
import 'package:sign_language/screens/sign-to_text.dart';
import 'package:sign_language/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sign',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const BottomSheetBarPage(),
    );
  }
}

