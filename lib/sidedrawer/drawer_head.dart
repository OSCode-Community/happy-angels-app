import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth_bloc.dart';
import '../blocs/profile/profile_cubit.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  void _getProfile() {
    final String uid = context.read<AuthBloc>().state.user!.uid;
    print('uid: $uid');
    context.read<ProfileCubit>().getProfile(uid: uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color.fromRGBO(151, 158, 49, 1),
                Color.fromRGBO(221, 34, 212, 0.945),
                Color.fromRGBO(245, 234, 90, 0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/account.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                state.user.name,
                style: TextStyle(color: Colors.black87, fontSize: 20),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Text(
                state.user.email,
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
              // TextButton(
              //   onPressed: () async {
              //     String email = Uri.encodeComponent("mail@fluttercampus.com");
              //     String subject = Uri.encodeComponent("Hello Flutter");
              //     String body =
              //         Uri.encodeComponent("Hi! I'm Flutter Developer");
              //     print(subject); //output: Hello%20Flutter
              //     Uri mail =
              //         Uri.parse("mailto:$email?subject=$subject&body=$body");
              //     if (await launchUrl(mail)) {
              //       //email app opened
              //     } else {
              //       //email app is not opened
              //       showNoMailAppsDialog(context);
              //     }
              //   },
              //   child: Text(
              //     "eKalakaar.com",
              //     style: TextStyle(
              //       color: Colors.grey[200],
              //       fontSize: 14,
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
