import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/BlocCubit/chat_cubit/chate_state.dart';
import 'package:untitled/constent/constents.dart';
import 'package:untitled/model/message_model.dart';

class chatCubit extends Cubit<ChatState> {
  chatCubit(): super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(KeyMessageColletions);

  List<Message> messagesList = [];

  void sendMessage({required String message, required String email}) {
    messages.add({
      keymessage: message,
      kCreatedAt: DateTime.now(),
      'id': email,
    });
  }

  void getMessage() {
    messages
        .orderBy(kCreatedAt, descending: true)
        .snapshots()
        .listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
          emit(ChatSuccess(messages: messagesList));
    });
  }
}
