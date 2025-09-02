import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/task_controller.dart';
import 'package:todoapp/services/app_database.dart';
import 'package:todoapp/services/preferneces.dart';
import 'package:todoapp/themes/button_theme.dart';
import 'package:todoapp/themes/text_theme.dart';
import 'package:todoapp/view/pages/home_page.dart';
import 'package:todoapp/view/pages/welcome_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Preferneces().init();
  
  runApp(BlocProvider(create: (_) => TaskController(), child: const MyApp()));
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
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(fontFamily: "Poppins"),
        ),
        textTheme: MyTextTheme.myTextTheme,
        elevatedButtonTheme: MyButtonTheme.myElevatedButtonTheme,
        // textThmeme: MyTextTheme.
      ),
      home: Preferneces().getString("userName") == null
          ? WelcomePage()
          : HomePage(),
    );
  }
}
