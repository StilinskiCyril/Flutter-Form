import 'package:flutter/material.dart';
import 'package:flutter_form/screens/forgot_password.dart';
import 'package:flutter_form/screens/home_screen.dart';
import 'package:flutter_form/screens/login_screen.dart';
import 'package:flutter_form/screens/register_screen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => HomeScreen(),
    '/login' : (context) => LoginScreen(),
    '/forgotPassword' : (context) => ForgotPasswordScreen(),
    '/register' : (context) => RegisterScreen()
  },
));

