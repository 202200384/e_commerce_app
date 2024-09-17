import 'package:flutter/material.dart';

class TextFieldItem extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  const TextFieldItem({
    Key? key,
    required this.fieldName,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.suffixIcon ,
    this.keyboardType = TextInputType.text,
    this.obscureText = false
}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.symmetric(vertical: 8),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(fieldName,style: TextStyle(
        fontWeight: FontWeight.bold
      ),),
      SizedBox(height: 8,),
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder()
        ),
        validator: validator,
      )
    ],),);
  }
}
