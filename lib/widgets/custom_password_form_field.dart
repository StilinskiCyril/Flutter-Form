import 'package:flutter/material.dart';
import 'package:mojapay/values/colors.dart';

class CustomPasswordFormField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final Function inputValidator;


  const CustomPasswordFormField({Key key, @required this.hintText, @required this.labelText,
    @required this.controller, @required this.inputValidator}) : super(key: key);

  @override
  _CustomPasswordFormFieldState createState() => _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  // Initialise password is obscure
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        style: TextStyle(
            fontSize: 12.0,
          fontWeight: FontWeight.bold
        ),
        obscureText: _obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                 Radius.circular(16.0),
              ),
              borderSide: BorderSide(color: gray)),
            focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(16.0),
            ),
          labelStyle: TextStyle(
              color: Colors.grey
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          suffixIcon:  IconButton(
            icon:Icon(_obscureText ? Icons.visibility:Icons.visibility_off,),
            onPressed: (){
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            color: Colors.indigo[900],
          ),
        ),
        validator: widget.inputValidator,
        controller: widget.controller,
      ),
    );
  }
}
