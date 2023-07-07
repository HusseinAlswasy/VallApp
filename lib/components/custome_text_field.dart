import 'package:flutter/material.dart';

class Custom_Text_Field extends StatelessWidget {
  Custom_Text_Field({super.key, required this.text,this.onChanged,this.obsecure=false});

  @override
  final String text;
  bool? obsecure;
  Function(String)? onChanged;
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure!,
      validator: (data){
        if(data!.isEmpty){
          return 'Feild is requiered , Try again';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: text,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}