import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:todoapp/core/pages/root_page.dart';
import 'package:todoapp/services/preferneces.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final String? username = Preferneces().getString("userName") ?? "username";
  var box = Hive.box('settings');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDark = box.get('isDark', defaultValue: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => RootPage()));
          },
          icon: Icon(Icons.arrow_back_outlined, color: theme.iconTheme.color),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Stack(
                      alignment: AlignmentGeometry.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/manal.jpg",
                          ),
                          radius: 85,
                        ),
                        Positioned(
                          right: 5,
                          bottom: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: theme.cardColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: !isDark? Color(0XFFD1DAD6) : Colors.transparent,
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: theme.iconTheme.color,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    username ?? "username",
                    style: theme.textTheme.labelLarge,
                  ),
                  Text(
                    "One task at a time.One step closer.",
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Profile Info", style: theme.textTheme.labelLarge),
                  ListTile(
                    leading: SvgPicture.asset(
                      "assets/icons/profile.svg",
                      color: theme.iconTheme.color,
                    ),
                    title: Text(
                      "User Details",
                      style: theme.textTheme.labelLarge,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_rounded,
                      color: theme.iconTheme.color,
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: SvgPicture.asset(
                      "assets/icons/theme.svg",
                      color: theme.iconTheme.color,
                    ),
                    title: Text("Dark Mode", style: theme.textTheme.labelLarge),
                    trailing: Switch(
                      value: isDark,
                      onChanged: (value) {
                        box.put('isDark', value);
                      },
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.logout_outlined,
                      color: theme.iconTheme.color,
                    ),
                    title: Text("Log Out", style: theme.textTheme.labelLarge),
                    trailing: Icon(
                      Icons.arrow_forward_rounded,
                      color: theme.iconTheme.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
