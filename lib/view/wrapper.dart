import 'package:flutter/material.dart';
import 'package:mcq_app/core/models/user_model.dart';
import 'package:provider/provider.dart';

import 'screens/auth_screens/authenticate.dart';
import 'screens/home_screen/home_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
