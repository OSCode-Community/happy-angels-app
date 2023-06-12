import 'package:bloc_auth_app/pages/auth/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const String routeName = '/forgotPassword';

  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  String? _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Reset Password"),
      //   backgroundColor: hexStringToColor("CB2B93"),
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(163, 26, 203, 1),
              Color.fromRGBO(182, 74, 177, 0.95),
              Color.fromRGBO(245, 234, 90, 0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: [
                Image.asset("assets/logo.png"),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black54,
                    )),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black87),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black54,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email required';
                    }
                    if (!isEmail(value.trim())) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _email = value;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(163, 26, 203, 0.61),
                    ),
                    child: const Text("Reset Password"),
                    onPressed: () {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(
                        email: _emailTextController.text,
                      )
                          .then((value) {
                        print("Reset email send");
                        Navigator.of(context).pop();
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    }),
                const SizedBox(
                  height: 10,
                ),
                signInOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "If you have account??",
          style: TextStyle(color: Colors.black38),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignInPage()));
          },
          child: const Text(
            "SIGN IN",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
