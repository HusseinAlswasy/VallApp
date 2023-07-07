

abstract class SignUpState{}

class SignUpInitial extends SignUpState{}
class SignUpLoading extends SignUpState{}
class SignUpSuccess extends SignUpState{}
class SignUpFailuer extends SignUpState{

  String errorMessage;
  SignUpFailuer({required this.errorMessage});

}
