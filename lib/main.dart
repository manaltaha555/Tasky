import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/task_controller.dart';
import 'package:todoapp/core/themes/dark_theme.dart';
import 'package:todoapp/core/themes/light_theme.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/services/preferneces.dart';
import 'package:todoapp/core/pages/splash_screen.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferneces().init();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasksBox');

  var settingsBox = await Hive.openBox('settings');

  if (settingsBox.get('isDark') == null) {
    await settingsBox.put('isDark', false);
  }

  runApp(BlocProvider(create: (_) => TaskController(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var settingsBox = Hive.box('settings');

    return ValueListenableBuilder(
      valueListenable: settingsBox.listenable(),
      builder: (context, value, child) {
        return MaterialApp(
          title: 'To Do',
          debugShowCheckedModeBanner: false,
          theme: LightTheme.theme,
          darkTheme: DarkTheme.theme,
          themeMode: settingsBox.get('isDark')
              ? ThemeMode.dark
              : ThemeMode.light,
          home: SplashScreen(),
        );
      },
    );
  }
}
