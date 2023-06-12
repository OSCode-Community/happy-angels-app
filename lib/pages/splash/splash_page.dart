import 'package:bloc_auth_app/blocs/auth/auth_bloc.dart';
import 'package:bloc_auth_app/pages/home/home_page.dart';
import 'package:bloc_auth_app/pages/auth/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'welcome_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //// for using shared preferences.
  // late bool showHome;
  // @override
  // Future<void> initState() async {
  //   // TODO: implement initState
  //   super.initState();
  //   final prefs = await SharedPreferences.getInstance();
  //   showHome = prefs.getBool("showHome") ?? false;
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // if (!showHome) {
        //   Navigator.pushNamedAndRemoveUntil(
        //     context,
        //     WelcomePage.routeName,
        //     // SignInPage.routeName,
        //     (route) {
        //       print('route.settings.name: ${route.settings.name}');
        //       print('ModalRoute: ${ModalRoute.of(context)!.settings.name}');

        //       return route.settings.name ==
        //               ModalRoute.of(context)!.settings.name
        //           ? true
        //           : false;
        //     },
        //   );
        if (state.authStatus == AuthStatus.unauthenticated) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            WelcomePage.routeName,
            // SignInPage.routeName,
            (route) {
              print('route.settings.name: ${route.settings.name}');
              print('ModalRoute: ${ModalRoute.of(context)!.settings.name}');

              return route.settings.name ==
                      ModalRoute.of(context)!.settings.name
                  ? true
                  : false;
            },
          );
        } else if (state.authStatus == AuthStatus.authenticated) {
          Navigator.pushNamed(context, HomePage.routeName);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
