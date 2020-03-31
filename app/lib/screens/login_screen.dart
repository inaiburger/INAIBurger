import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'tab_screen.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
  'inaiburger@gmail.com': '12345'
};

class LoginScreen extends StatelessWidget {
  final inputBorder = BorderRadius.vertical(
    bottom: Radius.circular(10.0),
    top: Radius.circular(20.0),
  );
  Duration get loginTime => Duration(milliseconds: 2250);

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
        title: '',
        logo: 'assets/burger.png',
        onLogin: _authUser,
        onSignup: _authUser,
        // showDebugButtons: true,
        theme: LoginTheme(
          primaryColor: Colors.brown,
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
