import 'package:bloc_auth_app/blocs/auth/auth_bloc.dart';
import 'package:bloc_auth_app/blocs/profile/profile_cubit.dart';
import 'package:bloc_auth_app/pages/auth/signin_page.dart';
import 'package:bloc_auth_app/pages/meeting/call_page.dart';
import 'package:bloc_auth_app/pages/profile/profile_page.dart';
import 'package:bloc_auth_app/sidedrawer/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _startMeeting() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CallPage(
                  callID: 'testing',
                  username: context.read<ProfileCubit>().state.user.name,
                  userId: context.read<ProfileCubit>().state.user.sid,
                )));
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
              GestureDetector(
                  onTap: _startMeeting, child: Text('Click to start meeting')),
            ],
          ),
        ),
      ),
    );
  }
}
