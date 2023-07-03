import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled/components/custome_button.dart';
import 'package:untitled/components/custome_text_field.dart';
import 'package:untitled/components/show_snak_bar.dart';
import 'package:untitled/constent/constents.dart';
import 'package:untitled/screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    onChanged: (data) {
                      password = data;
                    },
                    text: 'Password'),
                SizedBox(
                  height: 25,
                ),
                CustomeButton(
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                      if (formKey.currentState!.validate()) {
                        try {
                          await loginUser();
                          showSnackBar(
                              context, 'email login success', Colors.green);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(context,
                                'No User Found For this Email', Colors.red);
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context, 'Wrong Password ,Try Again',
                                Colors.red);
                          }
                        } catch (e) {
                          showSnackBar(
                              context,
                              'there was an error , please try again',
                              Colors.red);
                        }
                      } else {}
                      isLoading = false;
                      setState(() {

                      });
                    },
                    text: 'Login'),
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
    );
  }

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
