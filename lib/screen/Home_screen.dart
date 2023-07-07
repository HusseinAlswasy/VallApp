import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/BlocCubit/chat_cubit/chat_cubit.dart';
import 'package:untitled/BlocCubit/chat_cubit/chate_state.dart';
import 'package:untitled/components/custome_chat_buble.dart';
import 'package:untitled/constent/constents.dart';
import 'package:untitled/model/message_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  static String id = 'HomeScreen';

  final _controller = ScrollController();

  TextEditingController controller = TextEditingController();


  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;

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
            child: BlocBuilder<chatCubit,ChatState>(
              builder:(context,state) {
                var messagesList = BlocProvider.of<chatCubit>(context).messagesList;
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == email
                        ? chatBubule(
                      message: messagesList[index],
                    )
                        : chatBubule2(
                      message: messagesList[index],
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<chatCubit>(context).sendMessage(message: data, email: email,);
                controller.clear();
                _controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                );
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: Icon(
                  Icons.send,
                  color: KPrimaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: KPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
