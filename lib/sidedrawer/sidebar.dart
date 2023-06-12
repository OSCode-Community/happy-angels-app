import 'package:bloc_auth_app/pages/home/home_page.dart';
import 'package:bloc_auth_app/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../blocs/auth/auth_bloc.dart';
import 'drawer_head.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  final List drawerMenuListname = const [
    {
      "leading": Icon(
        Icons.account_circle,
        color: Colors.black87,
      ),
      "title": "Profile",
      "trailing": Icon(
        Icons.chevron_right,
      ),
      "action_id": 1,
    },
    {
      "leading": Icon(
        Icons.animation_rounded,
        color: Colors.black87,
      ),
      "title": "About Us",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 2,
    },
    {
      "leading": Icon(
        Icons.help,
        color: Colors.black87,
      ),
      "title": "Help",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 3,
    },
    {
      "leading": Icon(
        Icons.settings,
        color: Colors.black87,
      ),
      "title": "Settings",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 4,
    },
    {
      "leading": Icon(
        Icons.exit_to_app,
        color: Colors.black87,
      ),
      "title": "Log Out",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // color: Colors.yellow,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(221, 34, 212, 0.945),
              Color.fromRGBO(245, 234, 90, 0.8),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        width: 280,
        child: Drawer(
          // backgroundColor: Color.fromRGBO(213, 113, 216, 0.856),
          child: ListView(
            children: [
              MyHeaderDrawer(),
              const SizedBox(
                height: 1,
              ),
              ...drawerMenuListname.map((sideMenuData) {
                return ListTile(
                  leading: sideMenuData['leading'],
                  title: Text(
                    sideMenuData['title'],
                  ),
                  trailing: sideMenuData['trailing'],
                  onTap: () async {
                    Navigator.pop(context);
                    if (sideMenuData['action_id'] == 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AccountPage(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 2) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 3) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 4) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 5) {
                      // final pref = await SharedPreferences.getInstance();
                      // pref.setBool("showHome", false);
                      context.read<AuthBloc>().add(SignOutRequestedEvent());
                    }
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
