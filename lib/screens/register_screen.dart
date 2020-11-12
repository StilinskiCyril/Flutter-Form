import 'package:flutter/material.dart';
import 'package:flutter_form/widgets/custom_text_form_field.dart';
import 'package:flutter_form/widgets/custom_password_form_field.dart';

// Create a Form widget.
class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() {
    return RegisterScreenState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class RegisterScreenState extends State<RegisterScreen> {
  // Create a global key that uniquely identifies the Form widget
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTextFormField(hintText: 'Name is required*', controller: _nameController,
                    labelText: 'Name', requiredText: 'Name', textInputType: TextInputType.text),
                SizedBox(height: 5.0,),
                CustomTextFormField(hintText: 'Phone is required*', controller: _phoneController,
                    labelText: 'Phone', requiredText: 'Phone', textInputType: TextInputType.text),
                SizedBox(height: 5.0,),
                CustomTextFormField(hintText: 'Email is required*', controller: _emailController,
                    labelText: 'Email', requiredText: 'Email', textInputType: TextInputType.emailAddress),
                SizedBox(height: 5.0,),
                CustomPasswordFormField(controller: _passwordController,
                  hintText: 'Enter your password', labelText: 'Password', inputValidator: (value){
                    if (value.isEmpty) {
                      return 'Password is required*';
                    } else if(value.length < 6) {
                      return 'Password should exceed 6 characters';
                    }
                    return null;
                  },),
                SizedBox(height: 5.0,),
                CustomPasswordFormField(hintText: 'Confirm Password', labelText: 'Repeat Password', inputValidator: (value){
                    if (value.isEmpty) {
                      return 'Password is required*';
                    } else if(value != _passwordController.text){
                      return 'Password Mismatch';
                    }
                    return null;
                  },),
                SizedBox(height: 15.0,),
                Container(
                  width: double.infinity,
                  height: 45.0,
                  child: RaisedButton(
                    color: Colors.amber,
                      shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(8.0),  side: BorderSide(color: Colors.amber),),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        String name = _nameController.text.toString();
                        String phone = _phoneController.text.toString();
                        String email = _emailController.text.toString();
                        String password = _passwordController.text.toString();
                        // If the form is valid, display a snackbar
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('Name: $name, Phone: $phone, Email: $email, Password: $password')));
                      }
                    },
                    child: Text('Register'),
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                      child: Text(
                        'Already registered?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}