import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screen/Home_screen.dart';
import 'package:untitled/screen/Login_screen.dart';
import 'package:untitled/screen/signup_screen.dart';

void main() async{
  runApp(const MyApp());
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
      initialRoute: LoginScreen.id,
      // home: HomeScreen(),
    );
  }
}
