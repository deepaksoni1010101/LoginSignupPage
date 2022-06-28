import 'package:flutter/material.dart';
import 'package:loginapp/forgetpasswordpage.dart';
import 'package:loginapp/homepage.dart';
import 'package:loginapp/signup.dart';

import 'login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => const MyLogin(),
      'signup': (context) => const MySignUp(),
      'homepage': (context) => const HomePage(),
      'forgetpasswordpage': (context) => const ForgetPasswordPage(),
    },
  ));
}
