import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../auth/signin_page.dart';
import '../home/home_page.dart';

class WelcomePage extends StatefulWidget {
  static const String routeName = '/welcome';
  const WelcomePage({Key? key}) : super(key: key);

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context, state) async {
    if (state.authStatus == AuthStatus.unauthenticated) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        // WelcomePage.routeName,
        SignInPage.routeName,
        (route) {
          print('route.settings.name: ${route.settings.name}');
          print('ModalRoute: ${ModalRoute.of(context)!.settings.name}');

          return route.settings.name == ModalRoute.of(context)!.settings.name
              ? true
              : false;
        },
      );
    } else if (state.authStatus == AuthStatus.authenticated) {
      // final prefs = await SharedPreferences.getInstance();
      // prefs.setBool('showHome', true);
      Navigator.pushNamed(context, HomePage.routeName);
    }

    // Navigator.pushNamed(context, HomePage.routeName);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      titlePadding: EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 16.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.only(top: 100),
      // pageColor: Colors.purple,
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // Color.fromRGBO(151, 158, 49, 1),
            Color.fromRGBO(221, 34, 212, 0.945),
            Color.fromRGBO(245, 234, 90, 0.8),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.yellow.shade300,
        // allowImplicitScrolling: true,
        // autoScrollDuration: 3000,
        pages: [
          PageViewModel(
            title: "Unlock peace of mind with our virtual parenting ecosystem",
            body:
                "Offering valuable resources, personalized recommendations, and after-school support, all while prioritizing your unique parenting style.",
            image: _buildImage('images/account.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Witness your child's happiness soar with Happy Angels",
            body:
                "Our dedicated virtual angels who go above and beyond to foster their well-being.",
            image: _buildImage('images/accountparent.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Experience the best of both worlds",
            body:
                "Our virtual parenting program enhances your abilities, amplifies your efforts, and supports you in raising happy, thriving children.",
            image: _buildImage('images/childquestion.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Reimagine parenting with our virtual angel network",
            body:
                "experts who work hand in hand with you, ensuring your child receive the best care, education, and well-rounded development.",
            image: _buildImage('images/accountparent.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Reimagine parenting with our virtual angel network",
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Ensuring your child's health ", style: bodyStyle),
                    Icon(
                      Icons.health_and_safety_outlined,
                      color: Colors.yellow,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("education ", style: bodyStyle),
                    Icon(
                      Icons.cast_for_education,
                      color: Colors.yellow,
                    ),
                    Text(", and happiness ", style: bodyStyle),
                    Icon(
                      Icons.mood,
                      color: Colors.yellow,
                    ),
                  ],
                ),
                Text(
                  "while respecting your unique role as their loving parent.",
                  style: bodyStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            decoration: pageDecoration.copyWith(
              bodyFlex: 3,
              imageFlex: 4,
              bodyAlignment: Alignment.bottomCenter,
              imageAlignment: Alignment.topCenter,
            ),
            image: _buildImage('images/account.png'),
            reverse: true,
          ),
        ],
        onDone: () => _onIntroEnd(context, state),
        showSkipButton: false,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: true,
        back: const Icon(
          Icons.arrow_back,
          color: Colors.black87,
        ),
        skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.black87,
        ),
        done: const Text('Done',
            style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          // color: Color(0xFFBDBDBD),
          color: Colors.yellow,
          activeSize: Size(22.0, 10.0),
          activeColor: Colors.black54,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: ShapeDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(221, 34, 212, 0.945),
              Color.fromRGBO(245, 234, 90, 0.8),
            ],
          ),
          // color: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      );
    });
  }
}
