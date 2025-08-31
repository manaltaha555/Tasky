import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoapp/view/pages/completed_page.dart';
import 'package:todoapp/view/pages/home_page.dart';
import 'package:todoapp/view/pages/profile_page.dart';
import 'package:todoapp/view/pages/to_do_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentIndex = 0;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(),
      ToDoPage(),
      CompletedPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        backgroundColor: Color(0XFF181818),
        currentIndex: currentIndex,
        selectedItemColor: Color(0XFF15B86C),
        unselectedItemColor: Color(0XFFC6C6C6),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins",
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins",
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              colorFilter: ColorFilter.mode(
                currentIndex == 0
                    ? const Color(0XFF15B86C)
                    : const Color(0XFFC6C6C6),
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/toDo.svg",
              colorFilter: ColorFilter.mode(
                currentIndex == 1
                    ? const Color(0XFF15B86C)
                    : const Color(0XFFC6C6C6),
                BlendMode.srcIn,
              ),
            ),
            label: "To Do",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/completed.svg",
              colorFilter: ColorFilter.mode(
                currentIndex == 2
                    ? const Color(0XFF15B86C)
                    : const Color(0XFFC6C6C6),
                BlendMode.srcIn,
              ),
            ),
            label: "Completed",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/profile.svg",
              colorFilter: ColorFilter.mode(
                currentIndex == 3
                    ? const Color(0XFF15B86C)
                    : const Color(0XFFC6C6C6),
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
