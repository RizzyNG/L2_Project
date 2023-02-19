import 'package:flutter/material.dart';
import 'package:l2_harizhadi_project/services/firebaseauth_service.dart';
import 'package:l2_harizhadi_project/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//Controllers for e-mail and password textfields.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool signUp = true;
  String title = "Sign Up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //hide back arrow button
        automaticallyImplyLeading: false,
        title: Text('Hariz NG Project App'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 330,
                child: Image.asset('images/BookLogo.jpg'),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                // child: Text(
                //   title,
                //   style: TextStyle(
                //       color: Colors.blue[400],
                //       fontWeight: FontWeight.w500,
                //       fontSize: 30),
                // )),
                child: signUp
                    ? Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.blue[400],
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )
                    : Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.blue[400],
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () async {
                  if (signUp) {
                    var newuser = await FirebaseAuthService().signUp(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                    if (newuser != null) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  } else {
                    var reguser = await FirebaseAuthService().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                    if (reguser != null) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  }
                },
                child: signUp ? Text("Sign Up") : Text("Sign In"),
              ),
              //Sign up / Sign In toggler
              OutlineButton(
                onPressed: () {
                  setState(() {
                    signUp = !signUp;
                  });
                },
                child: signUp
                    ? Text("Have an account? Sign In")
                    : Text("Create an account"),
              )
            ],
          ),
        ),
      ),
    );
  } //build
}
