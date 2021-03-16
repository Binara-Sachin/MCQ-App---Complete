import 'package:flutter/material.dart';
import 'package:mcq_app/view/screens/auth_screens/sign_in_screen.dart';
import 'package:mcq_app/view/screens/auth_screens/sign_up_screen.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInScreen(toggleFunction: toggleView);
    } else {
      return SignUpScreen(toggleFunction: toggleView);
    }
  }
}
