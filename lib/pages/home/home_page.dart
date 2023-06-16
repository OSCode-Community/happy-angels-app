import 'package:bloc_auth_app/blocs/auth/auth_bloc.dart';
import 'package:bloc_auth_app/blocs/profile/profile_cubit.dart';
import 'package:bloc_auth_app/constants/meeting_constants.dart';
import 'package:bloc_auth_app/models/meeting_details_model.dart';
import 'package:bloc_auth_app/pages/auth/signin_page.dart';
import 'package:bloc_auth_app/pages/meeting/meeting_page.dart';
import 'package:bloc_auth_app/pages/profile/profile_page.dart';
import 'package:bloc_auth_app/sidedrawer/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: zegocloud_app_id /*input your AppID*/,
      appSign: zegocloud_app_sign /*input your AppSign*/,
      userID: context.read<ProfileCubit>().state.user.sid,
      userName: context.read<ProfileCubit>().state.user.name,
      plugins: [ZegoUIKitSignalingPlugin()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text('Home'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AccountPage();
                  }),
                );
              },
              icon: Icon(Icons.account_circle),
            ),
            IconButton(
              onPressed: () async {
                // final pref = await SharedPreferences.getInstance();
                // pref.setBool("showHome", false);
                context.read<AuthBloc>().add(SignOutRequestedEvent());
              },
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
        drawer: DrawerScreen(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://cdn.dribbble.com/users/1622791/screenshots/11174104/flutter_intro.png',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(height: 20.0),
              Text(
                'Angel App Home',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
              ZegoSendCallInvitationButton(
                isVideoCall: true,
                resourceID: "zegouikit_call", // For offline call notification
                invitees: [
                  ZegoUIKitUser(
                    id: 'mDl6fLqUK3YGtmJx206wAQ2XL9g2',
                    name: 'Akshay',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
