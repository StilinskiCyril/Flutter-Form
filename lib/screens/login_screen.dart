import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mojapay/widgets/custom_password_form_field.dart';
import 'package:mojapay/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Create a global key that uniquely identifies the Form widget
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 0),
        child: Container(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomTextFormField(
                      hintText: 'Email is required*',
                      controller: _emailController,
                      labelText: 'Email',
                      requiredText: 'Email',
                      textInputType: TextInputType.emailAddress),
                  SizedBox(
                    height: 5.0,
                  ),
                  CustomPasswordFormField(
                    controller: _passwordController,
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    inputValidator: (value) {
                      if (value.isEmpty) {
                        return 'Password is required*';
                      } else if (value.length < 6) {
                        return 'Password should exceed 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/forgotPassword");
                          },
                          child: Text('Forgot Password?',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 45.0,
                    child: RaisedButton(
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.amber),
                      ),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false
                        // otherwise.
                        if (_formKey.currentState.validate()) {
                          String name = _emailController.text.toString();
                          String password = _passwordController.text.toString();

                          print(name + password);

                          // If the form is valid, display a snackbar
                          // Scaffold.of(context).showSnackBar(SnackBar(
                          //     content:
                          //         Text('Name: $name, Password: $password')));
                        }
                      },
                      child: Text('Login'),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// SizedBox(height: 50.0),
// Row(
// children: [
// DecoratedBox(
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// image: DecorationImage(
// image: AssetImage('assets/logo.png'),
// fit: BoxFit.fill)),
// )
// ],
// ),
