import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/custome_button.dart';
import 'package:untitled/components/custome_text_field.dart';
import 'package:untitled/components/show_snak_bar.dart';
import 'package:untitled/constent/constents.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  static String id = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  Widget build(BuildContext context) {
    return ModalProgressHUD(
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
                  height: 50,
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
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Custom_Text_Field(text: 'Name'),
                SizedBox(
                  height: 8,
                ),
                Custom_Text_Field(
                  onChanged: (data) {
                    email = data;
                  },
                  text: 'Email',
                ),
                SizedBox(
                  height: 8,
                ),
                Custom_Text_Field(
                  onChanged: (data) {
                    password = data;
                  },
                  text: 'Password',
                ),
                SizedBox(
                  height: 8,
                ),
                Custom_Text_Field(text: 'Confirme Password'),
                SizedBox(
                  height: 25,
                ),
                CustomeButton(
                  text: 'Register',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    if (formKey.currentState!.validate()) {
                      try {
                        await registerUser();
                        showSnackBar(
                            context, 'email created success', Colors.green);
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          showSnackBar(
                              context, 'email-already-in-use', Colors.red);
                        } else if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'weak-password , try again', Colors.red);
                        }
                      } catch (e) {
                        showSnackBar(
                            context,
                            'there was an error , please try again',
                            Colors.red);
                      }
                    } else {}
                    isLoading = false;
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '  Login',
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
    );
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
