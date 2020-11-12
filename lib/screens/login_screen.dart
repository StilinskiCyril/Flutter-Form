import 'package:flutter/material.dart';
import 'package:flutter_form/widgets/custom_text_form_field.dart';
import 'package:flutter_form/widgets/custom_password_form_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Create a global key that uniquely identifies the Form widget
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
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
                      hintText: 'Name is required*',
                      controller: _nameController,
                      labelText: 'Name',
                      requiredText: 'Name',
                      textInputType: TextInputType.text),
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
                                color: Colors.blue, fontWeight: FontWeight.bold))
                      ),
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
                          String name = _nameController.text.toString();
                          String password = _passwordController.text.toString();
                          // If the form is valid, display a snackbar
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Name: $name, Password: $password')));
                        }
                      },
                      child: Text('Login'),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "/register");
                        },
                        child: Text(
                          'Not registered?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text('----OR LOGIN WITH----')],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(top: 30.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://w7.pngwing.com/pngs/543/934/png-transparent-google-app-logo-google-logo-g-suite-google-text-logo-circle.png'),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        margin: EdgeInsets.only(top: 30.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTYZKujb9jwCesJF9QDFKPo4VYIxnBEzq731A&usqp=CAU'),
                                fit: BoxFit.fill)),
                      )
                    ],
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