import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/BlocCubit/SignUp_cubit/SignUp_state.dart';


class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> registerUser({required String email, required String password}) async {
    emit(SignUpLoading());
    try {
      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!, password: password!);
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(SignUpFailuer(errorMessage: 'email already in use'));
      } else if (e.code == 'weak-password') {
        emit(SignUpFailuer(errorMessage: 'weak password'));
      }
    } catch (e) {
      emit(SignUpFailuer(errorMessage: 'There was an error , Please try again'));
    }
  }
}