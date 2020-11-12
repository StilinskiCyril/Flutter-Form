import 'package:flutter/material.dart';
import 'package:flutter_form/values/colors.dart';

class CustomTextFormField  extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String requiredText;
  final TextInputType textInputType;
  final TextEditingController controller;


  const CustomTextFormField({Key key, @required this.hintText, @required this.labelText,
    @required this.requiredText, @required this.textInputType,  @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
          style: TextStyle(
              fontSize: 12.0,fontWeight: FontWeight.bold
          ),
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
              hintText: hintText,
              labelText: labelText
          ),
          keyboardType: textInputType,
          controller: controller,
          validator: (value) {
            if (value.isEmpty) {
              return '$requiredText required*';
            }
            return null;
          },
        ),
    );
  }
}
