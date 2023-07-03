import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/custome_chat_buble.dart';
import 'package:untitled/components/custome_texte_feild.dart';
import 'package:untitled/constent/constents.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  static String id = 'HomeScreen';
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KeyMessageColletions);

  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: messages.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomeTextFeild(),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()),);
        }
      },
    );
  }
}
