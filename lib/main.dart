import 'package:flutter/material.dart';
import 'package:todoapp/themes/button_theme.dart';
import 'package:todoapp/themes/text_theme.dart';
import 'package:todoapp/view/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0XFF181818),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white
        ),
        textTheme: MyTextTheme.myTextTheme,
        elevatedButtonTheme: MyButtonTheme.myElevatedButtonTheme
       // textThmeme: MyTextTheme.
      ),
      home: WelcomePage(),
    );
  }
}

