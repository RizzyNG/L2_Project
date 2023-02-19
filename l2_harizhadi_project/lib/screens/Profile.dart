import 'package:flutter/material.dart';
import 'package:l2_harizhadi_project/screens/StartingScreens/login_page.dart';

class LoginProfile extends StatefulWidget {
  final String usernamevalue;
  final String passwordvalue;
  final String emailvalue;

  LoginProfile(
      {Key key, this.usernamevalue, this.passwordvalue, this.emailvalue})
      : super(key: key);
  @override
  State<LoginProfile> createState() => ProfileState();
}

class ProfileState extends State<LoginProfile> {
  Widget build(BuildContext context) {
    return Center(
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: 120,
              height: 120,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/BookLogo.jpg'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 320,
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "${widget.usernamevalue}",
                ),
                autofocus: false,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 320,
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "${widget.emailvalue}",
                ),
                autofocus: false,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              // onTap: () {
              //   Navigator.push(
              //       context, MaterialPageRoute(builder: (context) => Home()));
              // },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Change Username'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangeUsername()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Change Email'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangeEmail()));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeEmail extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'BookHere',
                  style: TextStyle(
                      color: Colors.green[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Change Email',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green[400],
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginProfile()));
                  },
                )),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green[400],
                  child: Text('Confirm Email'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginProfile(
                                  emailvalue: emailController.text,
                                )));
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class ChangeUsername extends StatelessWidget {
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'FindFoodSG',
                  style: TextStyle(
                      color: Colors.green[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Change Username',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green[400],
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginProfile()));
                  },
                )),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green[400],
                  child: Text('Confirm Username'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginProfile(
                                  usernamevalue: usernameController.text,
                                )));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
