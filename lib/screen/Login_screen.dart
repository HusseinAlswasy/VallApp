import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled/BlocCubit/Login_cubit/login_cubit.dart';
import 'package:untitled/BlocCubit/Login_cubit/login_state.dart';
import 'package:untitled/BlocCubit/chat_cubit/chat_cubit.dart';
import 'package:untitled/components/custome_button.dart';
import 'package:untitled/components/custome_text_field.dart';
import 'package:untitled/components/show_snak_bar.dart';
import 'package:untitled/screen/Home_screen.dart';
import 'package:untitled/screen/signup_screen.dart';


class LoginScreen extends StatelessWidget{
  static String id = 'LoginScreen';

  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context,state){
          if(state is LoginLoading){
            isLoading =true;
          }else if(state is LoginSuccess){
            BlocProvider.of<chatCubit>(context).getMessage();
            showSnackBar(context, 'email login Success ', Colors.green);
            Navigator.pushNamed(context, HomeScreen.id,arguments: email);
            isLoading =false;
          }else if(state is LoginFailuer){
            showSnackBar(context, state.errorMessage,Colors.red);
            isLoading =false;
          }
      },
      builder:(context,state)=> ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scolar Chat',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Custom_Text_Field(
                      onChanged: (data) {
                        email = data;
                      },
                      text: 'Email'),
                  SizedBox(
                    height: 8,
                  ),
                  Custom_Text_Field(
                    obsecure: true,
                      onChanged: (data) {
                        password = data;
                      },
                      text: 'Password'),
                  SizedBox(
                    height: 25,
                  ),
                  CustomeButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).loginUser(email: email!, password: password!);
                        } else {}
                      },
                      // onTap: () async {
                      //
                      //   isLoading = true;
                      //   if (formKey.currentState!.validate()) {
                      //     try {
                      //       await BlocProvider.of<LoginCubit>(context).loginUser(email: 'email', password: 'password');
                      //       showSnackBar(
                      //           context, 'email login success', Colors.green);
                      //         Navigator.pushNamed(context, HomeScreen.id,arguments: email);
                      //     } on FirebaseAuthException catch (e) {
                      //       if (e.code == 'user-not-found') {
                      //         showSnackBar(context,
                      //             'No User Found For this Email', Colors.red);
                      //       } else if (e.code == 'wrong-password') {
                      //         showSnackBar(context, 'Wrong Password ,Try Again',
                      //             Colors.red);
                      //       }
                      //     } catch (e) {
                      //       showSnackBar(
                      //           context,
                      //           'there was an error , please try again',
                      //           Colors.red);
                      //       print(e);
                      //     }
                      //
                      //   } else {}
                      //   isLoading = false;
                      // },
                      text: 'Login',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'dont\' have an account ?',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpScreen.id);
                        },
                        child: Text(
                          '  Register',
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
