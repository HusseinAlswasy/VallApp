import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  CustomeButton({super.key, required this.text,required this.onTap});

  @override
  final String text;
  VoidCallback? onTap;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}