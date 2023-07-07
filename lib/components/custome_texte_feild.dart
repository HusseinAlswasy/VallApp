// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled/constent/constents.dart';
//
// class CustomeTextFeild extends StatelessWidget {
//   CustomeTextFeild({super.key});
//
//   CollectionReference messages =
//       FirebaseFirestore.instance.collection(KeyMessageColletions);
//
//   TextEditingController controller = TextEditingController();
//
//   final _controller = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       onSubmitted: (data) {
//         messages.add({
//           keymessage: data, // Stokes and Sons
//           kCreatedAt: DateTime.now(),
//         });
//         controller.clear();
//         _controller.animateTo(
//           _controller.position.maxScrollExtent,
//           duration: Duration(seconds: 1),
//           curve: Curves.fastOutSlowIn,
//         );
//       },
//       decoration: InputDecoration(
//         hintText: 'Send Message',
//         suffixIcon: Icon(
//           Icons.send,
//           color: KPrimaryColor,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: BorderSide(
//             color: KPrimaryColor,
//           ),
//         ),
//       ),
//     );
//   }
// }
