import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart';
import 'tab_screen.dart';

const users = const {'inaiburger@gmail.com': '12345sukasuka'};

class LoginScreen extends StatelessWidget {
  final inputBorder = BorderRadius.vertical(
    bottom: Radius.circular(10.0),
    top: Radius.circular(20.0),
  );
  Duration get loginTime => Duration(milliseconds: 2300);
  Future<String> _signUp(LoginData data) {
    d(data.name, data.password);
    print('username: ${data.name}, password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      // if (!users.containsKey(data.name)) {
      //   return 'Username not exists';
      // }
      // if (users[data.name] != data.password) {
      //   return 'Password does not match';
      // }
      return null;
    });
  }

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<void> d(String name, String pass) async {
    var response = await post(
        Uri.parse(
            "https://sleepy-temple-85699.herokuapp.com/auth/users/"),
        body: {"username": "$name", "password": "$pass","email":"$name"},
        encoding: Encoding.getByName("utf-8"));
    print(response.statusCode);
    print(response.persistentConnection);
    print(response.isRedirect);
    print(response.body);
    return response;
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: 'InaiBurger',
        // logo: 'assets/images/logo.jpg',
        onLogin: _authUser,
        onSignup: _signUp,
        // showDebugButtons: true,
        theme: LoginTheme(
          primaryColor: Color.fromRGBO(163, 8, 11, 1),
        ),
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => TabsScreen(),
          ));
        },
        onRecoverPassword: _recoverPassword,
      ),
    );
  }
}
