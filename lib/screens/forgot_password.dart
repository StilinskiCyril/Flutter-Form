import 'package:flutter/material.dart';
import 'package:mojapay/widgets/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Create a global key that uniquely identifies the Form widget
  final _forgotPasswordFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 0),
        child: Container(
          child: Form(
            key: _forgotPasswordFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomTextFormField(
                      hintText: 'Email is required*',
                      controller: _emailController,
                      labelText: 'Email',
                      requiredText: 'Email',
                      textInputType: TextInputType.text),
                  SizedBox(
                    height: 5.0,
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
                        if (_forgotPasswordFormKey.currentState.validate()) {
                          String email = _emailController.text.toString();
                          // If the form is valid, display a snackbar
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content:
                              Text('Email: $email')));
                        }
                      },
                      child: Text('Send password reset link'),
                    ),
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
