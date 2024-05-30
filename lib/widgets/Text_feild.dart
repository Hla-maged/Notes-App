import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextField extends StatelessWidget {
  int maxLines;
  String hint;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  CustomTextField({required this.hint, this.maxLines = 1, this.onSaved,this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (val) {
        if (val?.isEmpty ?? true)
          return "Field is required";
        else
          return null;
      },
      cursorColor: KPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: KPrimaryColor))),
    );
  }
}
