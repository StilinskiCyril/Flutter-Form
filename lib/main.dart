import 'package:flutter/material.dart';
import 'package:mojapay/screens/forgot_password.dart';
import 'package:mojapay/screens/home_screen.dart';
import 'package:mojapay/screens/login_screen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => HomeScreen(),
    '/login' : (context) => LoginScreen(),
    '/forgotPassword' : (context) => ForgotPasswordScreen()
  },
));

