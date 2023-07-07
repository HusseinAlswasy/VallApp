import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  loginUser({required String email, required String password}) async {
    emit(LoginLoading());
    var auth = FirebaseAuth.instance;
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailuer(errorMessage: 'User Not Found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailuer(errorMessage: 'Wrong Password'));
      }
    } catch (e) {
      emit(LoginFailuer(errorMessage: 'There was an error , Please try again'));
    }
  }
}
