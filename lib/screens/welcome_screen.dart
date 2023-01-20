import 'package:chat_me/screens/login_screen.dart';
import 'package:chat_me/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_me/screens/login_screen.dart';
import 'package:chat_me/screens/registration_screen.dart';
import 'package:chat_me/components/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_me/main.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  //using curves in the code.
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
      // upperBound: 100.0,
    );

    // animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    animation = ColorTween(begin: Colors.redAccent, end: Colors.white)
        .animate(controller);

    // controller.reverse(from: 1 * 100);
    controller.forward();

    // This is the status checker code fo the animation.
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logoflash.png'),
                    // height: animation.value * 100,
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  // duration: Duration(seconds: 3),
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
