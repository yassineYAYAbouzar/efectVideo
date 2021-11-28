

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextFilde extends StatelessWidget {
  final String  hint ;
  final prefixIcon ;
  final bool isPassword ;
  final bool  obscureText ;
  final Widget label;
  final  onSaved;
  const CustomTextFilde({Key key,this.hint='Sum Text',this.label, this.onSaved,this.prefixIcon,this.isPassword=false,this.obscureText=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        label: label,
        prefixIcon:prefixIcon,
        suffixIcon: isPassword ?  Icon(Icons.remove_red_eye_outlined):Icon(Icons.mail,size: 0,),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder:OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
