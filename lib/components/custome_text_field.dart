import 'package:flutter/material.dart';

class Custom_Text_Field extends StatelessWidget {
  Custom_Text_Field({super.key, required this.text,this.onChanged});

  @override
  final String text;
  Function(String)? onChanged;
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: text,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}