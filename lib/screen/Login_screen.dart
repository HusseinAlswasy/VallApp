import 'package:flutter/material.dart';
import 'package:untitled/components/custome_button.dart';
import 'package:untitled/components/custome_text_field.dart';
import 'package:untitled/constent/constents.dart';
import 'package:untitled/screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  static String id = 'LoginScreen';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    color: Colors.white,
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
                    color: Colors.white,
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
                // onchanged: (data) {
                //   email = data;
                // },
                text: 'Email'),
            SizedBox(
              height: 8,
            ),
            Custom_Text_Field(
                // onchanged: (data) {
                //   password = data;
                // },
                text: 'Password'),
            SizedBox(
              height: 25,
            ),
            CustomeButton(
                onTap:() async {
                // var auth = FirebaseAuth.instance;
                // UserCredential user =
                //     await auth.createUserWithEmailAndPassword(
                //   email: email!,
                //   password: password!,
                // );
                // print(user.user!.displayName);
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
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpScreen.id);
                  },
                  child: Text(
                    '  Register',
                    style: TextStyle(
                      color: Color(0xffC7EDE6),
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
    );
  }
}
