import 'package:flutter/material.dart';
import 'package:recurly_analytics/home_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:recurly_analytics/redux.dart';

class LoginPage extends StatelessWidget {
  static String tag = 'login-page';

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, LoginViewModel>(
      converter: (store) {
        return LoginViewModel(
            state: store.state,
            onSubmit: (email, password) => store.dispatch(GetCookieAction(email, password))
        );
      },
      builder: (BuildContext context, LoginViewModel vm) {
        final emailController = TextEditingController();

        final passwordController = TextEditingController();

        final logo = Hero(
          tag: 'hero',
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 48.0,
            child: Image.asset('assets/logo.png'),
          ),
        );

        final email = TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          controller: emailController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Email',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0)),
          ),
        );

        final password = TextFormField(
          autofocus: false,
          obscureText: true,
          controller: passwordController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Password',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0)),
          ),
        );

        final loginButton = Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () => vm.onSubmit(email.controller.value.text, password.controller.value.text),
            padding: EdgeInsets.all(12),
            color: Colors.teal,
            child: Text('Log In', style: TextStyle(color: Colors.white)),
          ),
        );

        final errorText = Text(
          vm.state.hasError ? 'Email or Password not found' : "",
        );

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.purple,
                Colors.purpleAccent,
              ]),
            ),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                children: <Widget>[
                  logo,
                  SizedBox(height: 48.0),
                  email,
                  SizedBox(height: 8.0),
                  password,
                  SizedBox(height: 8.0),
                  errorText,
                  SizedBox(height: 24.0),
                  loginButton,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class LoginViewModel {
  final AppState state;
  final void Function(String email, String password) onSubmit;

  LoginViewModel({this.state, this.onSubmit});
}
