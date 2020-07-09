import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/blocs/login/login/index.dart';
import 'package:foodieng/models/User.dart';
import 'package:foodieng/screens/home.dart';
import 'package:foodieng/screens/register.dart';
import 'package:foodieng/utils/fadein.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    BlocProvider.of<LoginBloc>(context)
        .add(UsernameChanged(text: _usernameController.text));
  }

  void _onPasswordChanged() {
    BlocProvider.of<LoginBloc>(context)
        .add(PasswordChanged(text: _passwordController.text));
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  _onLoginButtonPressed() {
    final user = User(
        username: _usernameController.value.text,
        password: _passwordController.value.text);
    BlocProvider.of<LoginBloc>(context).add(LogginButtonPressed(user: user));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFailure) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('${state.errorMessage}'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 4),
        ));
      }
      if (state is LoginSuccess) {
        Navigator.pushAndRemoveUntil(
            context,
            FadeRoute(
                page: Home(
              isLogin: true,
            )),
            (route) => false);
        //.pushReplacement(context, FadeRoute(page: Home()));
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 3,
            leading: IconButton(
              color: Theme.of(context).primaryColor,
              iconSize: MediaQuery.of(context).size.width / 12,
              onPressed: () => Navigator.pop(context, false),
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sign In",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: MediaQuery.of(context).size.width / 18),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      Text('Enjoy our application'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 55,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 8.0, 32, 8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          controller: _usernameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: "Email",
                            // hintText: 'Email Address',
                            errorText: (state is UsernameError)
                                ? state.errorMessage
                                : null,
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32, 8.0),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.key),
                            errorText: (state is PasswordError)
                                ? state.errorMessage
                                : null,
                            //hintText: 'Password',
                            labelText: 'Password',
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              onPressed: (state is IsFormValid)
                                  ? _onLoginButtonPressed
                                  : null,
                              splashColor: Colors.white,
                              padding: EdgeInsets.all(12),
                              color: Color(0xff462618),
                              child: Text('Sign In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              25)),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Container(
                                child: state is LoginLoading
                                    ? CircularProgressIndicator(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                      )
                                    : null),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Don’t have an account?',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.width / 25),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          FlatButton(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30),
                            ),
                            onPressed: () => Navigator.push(
                                context, FadeRoute(page: Register())),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        //);
      },
    ));
  }
}
