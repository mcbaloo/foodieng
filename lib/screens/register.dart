import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/blocs/login/login/index.dart';
import 'package:foodieng/models/User.dart';
import 'package:foodieng/screens/login.dart';
import 'package:foodieng/utils/ValidationMixin.dart';
import 'package:foodieng/utils/fadein.dart';
import 'package:foodieng/utils/login_util.dart';

class Register extends StatefulWidget with ValidationMixin {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> with ValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserRepository userRepository = UserRepository();
  final LoginBloc _loginBloc = LoginBloc();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confrimPasswordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confrimPasswordController.dispose();
    _lastnameController.dispose();
    _firstnameController.dispose();
    //passwordFocusNode.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(EmailChanged(text: _usernameController.text));
  }

  void _onPasswordChanged() {
    _loginBloc.add(RegisterPasswordChanged(text: _usernameController.text));
  }

  _onRegisterButtonPressed() {
    if (_formKey.currentState.validate()) {
      final registerObj = RegisterUser(
          _usernameController.value.text,
          _passwordController.value.text,
          _confrimPasswordController.value.text,
          _firstnameController.value.text,
          _lastnameController.value.text,
          _usernameController.value.text,
          "City",
          "State",
          "Country",
          "Lagos");
      _loginBloc.add(RegisterButtonPressed(user: registerObj));
    }
  }

  @override
  void initState() {
    super.initState();
    //passwordFocusNode = FocusNode();
    _usernameController.addListener(_onEmailChanged);
    _confrimPasswordController.addListener(() {
      _loginBloc.add(ConfirmPasswordChanged(
          text: _confrimPasswordController.text,
          password: _passwordController.text));
    });
    _firstnameController.addListener(() {
      _loginBloc.add(FirstNameChanged(text: _firstnameController.text));
    });
    _lastnameController.addListener(() {
      _loginBloc.add(LastNameChanged(text: _lastnameController.text));
    });
    _passwordController.addListener(_onPasswordChanged);
  }

  // _onConfrimPasswordChanged(String text) {
  //   _loginBloc.add(
  //       ConfirmPasswordChanged(text: text, password: _passwordController.text));
  // }

  @override
  Widget build(BuildContext context) {
    void showAlertDialog(BuildContext context) {
      Widget continueButton = FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          onPressed: () => Navigator.pushAndRemoveUntil(
              context, FadeRoute(page: Login()), (route) => false), //logOut(),
          child: Text("Yes"));

      AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("Success"),
        content: Text("Registration Successful.. Proceed to Login"),
        actions: <Widget>[continueButton],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

    return BlocProvider<LoginBloc>(
      create: (context) {
        return LoginBloc();
      },
      child: BlocListener<LoginBloc, LoginState>(
        bloc: _loginBloc,
        listener: (context, state) {
          if (state is RegisterSuccess) showAlertDialog(context);
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          bloc: _loginBloc,
          builder: (context, state) => Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                color: Theme.of(context).primaryColor,
                iconSize: MediaQuery.of(context).size.width / 12,
                onPressed: () => Navigator.pop(context, false),
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body: SafeArea(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 5.5,
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Create an Account",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.width / 18),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 11,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 8.0, 16, 8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                autofocus: false,
                                obscureText: false,
                                validator: (String text) {
                                  if (text.isEmpty) {
                                    return "First Name cannot be empty";
                                  }
                                  return null;
                                },
                                controller: _firstnameController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(FontAwesomeIcons.user),
                                  //hintText: 'First Name',
                                  labelText: "First Name",
                                  // errorText: (state is FirstNameError)
                                  //     ? state.errorMessage
                                  //     : null,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 11,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 8.0, 16, 8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                autofocus: false,
                                obscureText: false,
                                controller: _lastnameController,
                                validator: (String text) {
                                  if (text.isEmpty) {
                                    return "Last Name cannot be Empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(FontAwesomeIcons.user),
                                  //hintText: 'First Name',
                                  labelText: "Last Name",
                                  // errorText: (state is LastNameError)
                                  //     ? state.errorMessage
                                  //     : null,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 3.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 11,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 8.0, 16, 8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                autofocus: false,
                                obscureText: false,
                                validator: (String text) {
                                  if (text.isEmpty) {
                                    return "Email Cannot be empty";
                                  } else if (!validateEmailAddress(text)) {
                                    return "Invalid Email Address";
                                  }
                                  return null;
                                },
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  //hintText: 'First Name',
                                  // errorText: (state is UsernameError)
                                  //     ? state.errorMessage
                                  //     : null,
                                  labelText: "Email Address",
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 3.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 11,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 8.0, 16, 8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                autofocus: false,
                                obscureText: true,
                                controller: _passwordController,
                                validator: (String text) {
                                  if (text.isEmpty) {
                                    return "Password cannot be empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(FontAwesomeIcons.key),
                                  //hintText: 'First Name',
                                  labelText: "Password",
                                  // errorText: (state is RegisterPasswordError)
                                  //     ? state.errorMessage
                                  //     : null,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 3.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 11,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 8.0, 16, 8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                autofocus: false,
                                obscureText: true,
                                validator: (String text) {
                                  if (text.isEmpty) {
                                    return "Confirm Password cannot be empty";
                                  } else if (text.trim() !=
                                      _passwordController.value.text.trim()) {
                                    return "Password donot Match";
                                  }
                                  return null;
                                },
                                //onChanged: (text) =>
                                //s  _onConfrimPasswordChanged(text),
                                controller: _confrimPasswordController,
                                decoration: InputDecoration(
                                  // errorText: (state is ConfirmPasswordError)
                                  //     ? state.errorMessage
                                  //     : null,
                                  prefixIcon: Icon(FontAwesomeIcons.key),
                                  //hintText: 'First Name',
                                  labelText: "Confirm Password",
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 3.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 60,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.0),
                              //padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                onPressed: _onRegisterButtonPressed,
                                // splashColor: Color(0xffd4af37),
                                padding: EdgeInsets.all(12),
                                color: Theme.of(context).primaryColor,
                                child: Text('Register',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Container(
                                child: state is LoginLoading
                                    ? LinearProgressIndicator(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                      )
                                    : null),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Already have an account?',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 25),
                              ),
                              // SizedBox(
                              //   width: 1,
                              // ),
                              FlatButton(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              30),
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
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
