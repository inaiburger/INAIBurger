import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'tab_screen.dart';
import 'package:http/http.dart' as http;

const users = const {
  'inaiburger@gmail.com': '12345'
};

class LoginScreen extends StatelessWidget {
  final inputBorder = BorderRadius.vertical(
    bottom: Radius.circular(10.0),
    top: Radius.circular(20.0),
  );
  Duration get loginTime => Duration(milliseconds: 2300);
Future<String>_signUp(LoginData data){
  print('Name: ${data.name}, Password: ${data.password}');
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

  Future<void> request() async {
    var client = http.Client();
    try {
      var uriResponse = await client.post(
          'https://sleepy-temple-85699.herokuapp.com/docs/swagger/auth/jwt/refresh/',
          body: {
            "refresh":
                "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4OTM1Mzg4OCwianRpIjoiYmU4MTRhODc2OWRhNGJhYThjODc0YzQ3N2RjMmZkOWIiLCJ1c2VyX2lkIjoxfQ.gBoA4G-G0nH5PWPD-yf8yJhPymjSBC2hMIBdA5Yt10g",
            "access":
                "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTg5MjY3Nzg4LCJqdGkiOiJjMDFjOWI4YzVkYjQ0MDA1ODNkOGExMjk1NGVhYmNiZSIsInVzZXJfaWQiOjF9.vEPPBx-mAtP-eMAUni-izzbNFdUy4YnUBa9ZDzC5NLQ"
          });
      print(await client.get(uriResponse.body));
    } finally {
      client.close();
    }
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
