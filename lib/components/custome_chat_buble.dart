import 'package:flutter/material.dart';
import 'package:untitled/constent/constents.dart';
import 'package:untitled/model/message_model.dart';
class chatBubule extends StatelessWidget {
   chatBubule({
    super.key,
    required this.message,
  });

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8,top: 16,left: 16,right: 16),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: KPrimaryColor,
          ),
          child: Text(
            message.message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
