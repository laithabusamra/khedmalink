import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/screens/home.dart';
import 'package:khedma_link/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    // SystemUiOverlayStyle(statusBarColor: Colors.transparent)); it was for the todo
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          primaryColor: buttounColor, scaffoldBackgroundColor: backGColor),
      home: WelcomeScreen(),
    );
  }
}
