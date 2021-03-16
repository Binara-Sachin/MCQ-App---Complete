import 'package:flutter/material.dart';
import 'package:mcq_app/core/services/auth.dart';
import 'package:mcq_app/view/shared/constants.dart';
import 'package:mcq_app/view/widgets/loading_widget.dart';

class SignInScreen extends StatefulWidget {
  final Function toggleFunction;

  const SignInScreen({Key key, this.toggleFunction}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  //Text Field State
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? LoadingWidget() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign In"),
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleFunction();
              },
              icon: Icon(Icons.person),
              label: Text("Register"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) =>
                    val.isEmpty ? 'Email cannot be empty' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val.length < 6
                    ? 'Password should at least have 6 characters'
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    error = '';
                  });

                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });

                    dynamic result = await _authService.signIn(email, password);

                    if (result == null) {
                      setState(() {
                        error = "Invalid email or password";
                        loading = false;
                      });
                    }
                  } else {
                    print("Invalid inputs");
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  "Sign in as Guest",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });

                  dynamic result = await _authService.signInAnonymously();

                  if (result == null) {
                    print("Error sign in");
                    setState(() {
                      loading = false;
                    });
                  } else {
                    print("Signed in");
                    print(result.uid);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
