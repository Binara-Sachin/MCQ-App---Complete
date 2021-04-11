import 'package:flutter/material.dart';
import 'package:mcq_app/core/models/paper_model.dart';
import 'package:mcq_app/core/services/auth.dart';
import 'package:mcq_app/core/services/database.dart';
import 'package:provider/provider.dart';

import 'file:///D:/Projects/MCQ%20App/mcq_app/lib/view/screens/home_screen/widgets/paper_list.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Paper>>.value(
      value: DatabaseService().papers,
      child: Scaffold(
        //backgroundColor: Colors.brown[100],
        appBar: AppBar(
          //backgroundColor: Colors.brown[400],
          //elevation: 0.0,
          title: Text("Home"),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("logout"),
              onPressed: () async {
                await _authService.signOut();
              },
            )
          ],
        ),
        body: PaperList(),
      ),
    );
  }
}
