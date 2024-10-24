import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/my_theme.dart';

class CustomTextFormField extends StatelessWidget {
  String? Function(String?) validator;
  TextEditingController controller;
  String label;
  bool obscureText;

  CustomTextFormField({
    super.key,
    required this.validator,
    required this.obscureText,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: Colors.blue, width: 2))
        ,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: Colors.blue, width: 2))
        ,
        label: Text(label,style: TextStyle(color: Colors.black54),),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.blue, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: Colors.blue, width: 2))),
      obscureText: obscureText,
    );
  }
}
