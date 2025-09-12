import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_ce/hive.dart';
import 'package:todoapp/services/preferneces.dart';
import 'package:todoapp/core/pages/root_page.dart';
import 'package:todoapp/core/pages/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final box;
  late final bool isDark;
  @override
  void initState() {
    navigate();
    super.initState();
      box = Hive.box('settings');
      isDark = box.get('isDark', defaultValue: false);


  }

  Future<void> navigate() async {
    await Future.delayed(
      Duration(seconds: 2),
      () => Preferneces().getString("userName") != null
          // ignore: use_build_context_synchronously
          ? Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => RootPage()),
              (Route<dynamic> route) => false,
            )
          // ignore: use_build_context_synchronously
          : Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => WelcomePage()),
              (Route<dynamic> route) => false,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark?LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0XFF15B86C).withValues(alpha: 0.5),
              Colors.black,
              Color(0XFF15B86C),
            ],
          ): null,
          color: Colors.white,
        ),
        child: Center(
          child: SvgPicture.asset(
            "assets/icons/icon.svg",
            height: 87,
            width: 87,
          ),
        ),
      ),
    );
  }
}
