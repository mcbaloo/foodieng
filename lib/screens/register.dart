import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image(
                    colorBlendMode: BlendMode.softLight,
                    image: AssetImage("assets/images/foodieng_logo.png"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text(
                    "Create an Account",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.width / 18),
                  ),
                  SizedBox(height: 20),
                  inputField(context, FontAwesomeIcons.user, 'First Name',
                      TextInputType.text, false),
                  inputField(context, FontAwesomeIcons.user, 'Last Name',
                      TextInputType.text, false),
                  inputField(context, Icons.email, 'Email Address',
                      TextInputType.emailAddress, false),
                  inputField(context, FontAwesomeIcons.userCircle, 'UserName',
                      TextInputType.text, false),
                  inputField(context, FontAwesomeIcons.key, 'Password',
                      TextInputType.text, true),
                  inputField(context, FontAwesomeIcons.key, 'Confirm Password',
                      TextInputType.text, true),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.0),
                      //padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onPressed: () {
                          //Navigator.of(context).pushNamed(HomePage.tag);
                        },
                        // splashColor: Color(0xffd4af37),
                        padding: EdgeInsets.all(12),
                        color: Theme.of(context).primaryColor,
                        child: Text('Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width / 25)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: MediaQuery.of(context).size.width / 25),
                      ),
                      // SizedBox(
                      //   width: 1,
                      // ),
                      FlatButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: MediaQuery.of(context).size.width / 30),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget inputField(BuildContext context, IconData icon, String labelText,
    TextInputType type, bool ObText) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 11,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 8.0, 16, 8.0),
      child: TextFormField(
        keyboardType: type,
        autofocus: false,
        initialValue: '',
        obscureText: ObText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          //hintText: 'First Name',
          labelText: labelText,
          contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    ),
  );
}
