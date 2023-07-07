import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/BlocCubit/Login_cubit/login_cubit.dart';
import 'package:untitled/BlocCubit/SignUp_cubit/SignUp_cubit.dart';
import 'package:untitled/BlocCubit/chat_cubit/chat_cubit.dart';
import 'package:untitled/screen/Home_screen.dart';
import 'package:untitled/screen/Login_screen.dart';
import 'package:untitled/screen/signup_screen.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context)=> LoginCubit(),),
        BlocProvider(create: (context)=> SignUpCubit(),),
        BlocProvider(create: (context)=> chatCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          HomeScreen.id: (context) => HomeScreen(),
        },
        initialRoute: LoginScreen.id,
      ),
    );
  }
}
