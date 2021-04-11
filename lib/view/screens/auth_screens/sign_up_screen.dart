import 'package:flutter/material.dart';
import 'package:mcq_app/core/services/auth.dart';
import 'package:mcq_app/view/shared/constants.dart';
import 'package:mcq_app/view/widgets/loading_widget.dart';

class SignUpScreen extends StatefulWidget {
  final Function toggleFunction;

  const SignUpScreen({Key key, this.toggleFunction}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  //Text Field State
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingWidget()
        : Scaffold(
            //backgroundColor: Colors.brown[100],
            //extendBodyBehindAppBar: true,
            appBar: AppBar(
              //backgroundColor: Colors.transparent,
              //elevation: 0.0,
              //centerTitle: true,
              title: Text("Sign Up"),
              actions: [
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleFunction();
                    },
                    icon: Icon(Icons.person),
                    label: Text("Sign In"))
              ],
            ),
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/SignUp.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  //padding: EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 20.0),
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(hintText: 'Email'),
                          validator: (val) => val.isEmpty ? 'Email cannot be empty' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(hintText: 'Password'),
                          obscureText: true,
                          validator: (val) => val.length < 6 ? 'Password should at least have 6 characters' : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          //color: Colors.pink[400],
                          child: Text("Sign up"),
                          onPressed: () async {
                            setState(() {
                              error = '';
                            });

                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });

                              dynamic result = await _authService.signUp(email, password);

                              if (result == null) {
                                setState(() {
                                  error = "Invalid email";
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
