import 'package:bloc_auth_app/pages/auth/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';

import '../../blocs/signup/signup_cubit.dart';
import '../../utils/error_dialog.dart';

class SignupPage extends StatefulWidget {
  static const String routeName = '/signup';

  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _passwordController = TextEditingController();
  String? _name, _email, _password;
  bool isSwitched = true;

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    print('name: $_name, email: $_email, password: $_password');

    context.read<SignupCubit>().signup(
          name: _name!,
          email: _email!,
          password: _password!,
        );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state.signupStatus == SignupStatus.error) {
            print('signup error');
            errorDialog(context, state.error);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Image.asset(
                      "assets/H_A.png",
                      color: Colors.black,
                      width: 350,
                    ),
                  ),
                  Positioned(
                    left: 50,
                    bottom: 500,
                    child: Container(
                      height: 500,
                      width: 500,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        gradient: RadialGradient(
                          focal: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(245, 234, 90, 0.3),
                            Color.fromRGBO(163, 26, 203, 0.61),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 600,
                    child: Container(
                      height: 500,
                      width: 500,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.all(Radius.circular(200)),
                        color: Colors.white,
                        gradient: RadialGradient(
                          focal: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(245, 234, 90, 0.5),
                            Color.fromRGBO(163, 26, 203, 0.55),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 120,
                      ),
                      Card(
                        elevation: 10,
                        margin: const EdgeInsets.all(30),
                        shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Form(
                            key: _formKey,
                            autovalidateMode: _autovalidateMode,
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              reverse: true,
                              children: [
                                Container(
                                  width: 200.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                            163, 26, 203, 1),
                                        width: 1,
                                      )),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (state.signupStatus !=
                                                  SignupStatus.submitting) {
                                                Navigator.pop(context);
                                              }
                                              isSwitched = true;
                                            });
                                          },
                                          child: FractionallySizedBox(
                                            widthFactor: 0.5,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: isSwitched
                                                    ? Colors.white
                                                    : const Color.fromRGBO(
                                                        163, 26, 203, 1),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Login',
                                                  style: TextStyle(
                                                    color: isSwitched
                                                        ? const Color.fromRGBO(
                                                            137, 70, 166, 1)
                                                        : Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isSwitched = false;
                                            });
                                          },
                                          child: FractionallySizedBox(
                                            widthFactor: 0.5,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: isSwitched
                                                    ? const Color.fromRGBO(
                                                        163, 26, 203, 1)
                                                    : Colors.white,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Signup',
                                                  style: TextStyle(
                                                    color: isSwitched
                                                        ? Colors.white
                                                        : const Color.fromRGBO(
                                                            137, 70, 166, 1),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color:
                                          Color.fromRGBO(238, 136, 250, 0.82),
                                    )),
                                    labelStyle: TextStyle(
                                        color: Color.fromRGBO(
                                            238, 136, 250, 0.82)),
                                    labelText: 'Name',
                                    prefixIcon: Icon(
                                      Icons.account_box,
                                      color:
                                          Color.fromRGBO(238, 136, 250, 0.82),
                                    ),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Name required';
                                    }
                                    if (value.trim().length < 2) {
                                      return 'Name must be at least 2 characters';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    _name = value;
                                  },
                                ),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  autocorrect: false,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color:
                                          Color.fromRGBO(238, 136, 250, 0.82),
                                    )),
                                    labelStyle: TextStyle(
                                        color: Color.fromRGBO(
                                            238, 136, 250, 0.82)),
                                    labelText: 'Email',
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color:
                                          Color.fromRGBO(238, 136, 250, 0.82),
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
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color:
                                          Color.fromRGBO(238, 136, 250, 0.82),
                                    )),
                                    labelStyle: TextStyle(
                                        color: Color.fromRGBO(
                                            238, 136, 250, 0.82)),
                                    labelText: 'Password',
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color:
                                          Color.fromRGBO(238, 136, 250, 0.82),
                                    ),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Password required';
                                    }
                                    if (value.trim().length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    _password = value;
                                  },
                                ),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color:
                                          Color.fromRGBO(238, 136, 250, 0.82),
                                    )),
                                    labelStyle: TextStyle(
                                        color: Color.fromRGBO(
                                            238, 136, 250, 0.82)),
                                    labelText: 'Confirm password',
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color:
                                          Color.fromRGBO(238, 136, 250, 0.82),
                                    ),
                                  ),
                                  validator: (String? value) {
                                    if (_passwordController.text != value) {
                                      return 'Passwords not match';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10.0),
                                ElevatedButton(
                                  onPressed: state.signupStatus ==
                                          SignupStatus.submitting
                                      ? null
                                      : _submit,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(163, 26, 203, 1),
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  child: Text(
                                    state.signupStatus ==
                                            SignupStatus.submitting
                                        ? 'Loading...'
                                        : 'Sign Up',
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                const Text(
                                  "OR",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(238, 136, 250, 0.82),
                                    fontSize: 24,
                                  ),
                                ),
                                // const SizedBox(height: 20),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Image.network(
                                //       'https://www.deliverlogic.com/wp-content/uploads/2021/04/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13-300x300.png',
                                //       height: 40,
                                //       width: 38,
                                //     ),
                                //     const SizedBox(width: 20),
                                //     Image.network(
                                //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2Id8NXgB0cF37PeSCxZNVajlhSl_vOh0Da6kY8nI&s",
                                //       height: 38,
                                //       width: 38,
                                //     ),
                                //     const SizedBox(width: 20),
                                //     Image.network(
                                //       "https://png.pngtree.com/png-vector/20221018/ourmid/pngtree-twitter-social-media-round-icon-png-image_6315985.png",
                                //       height: 40,
                                //       width: 38,
                                //     ),
                                //   ],
                                // ),
                              ].reversed.toList(),
                            ),
                          ),
                        ),
                      ),
                      // const Text(
                      //   '"Virtual Care, Real Happiness"',
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     color: Color.fromRGBO(238, 136, 250, 0.82),
                      //   ),
                      // ),
                      Image.asset(
                        "assets/transistor.png",
                        color: const Color.fromRGBO(163, 26, 203, 0.82),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
