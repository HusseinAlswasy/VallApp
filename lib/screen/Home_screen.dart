import 'package:flutter/material.dart';
import 'package:untitled/components/custome_chat_buble.dart';
import 'package:untitled/constent/constents.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  static String id = 'HomeScreen';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/scholar.png',
              scale: 2,
            ),
            Text('Chat'),
          ],
        ),
        backgroundColor: KPrimaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return chatBubule();
              },
            ),
          ),
          
        ],
      ),
    );
  }
}
