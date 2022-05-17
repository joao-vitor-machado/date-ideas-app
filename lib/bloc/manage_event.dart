import 'package:trabalho_fibal_mob_2022/bloc/manage_state.dart';

abstract class SignupEvent {}

class SignupNameChanged extends SignupEvent {
  final String name;

  SignupNameChanged({required this.name});
}

class SignupAgeChanged extends SignupEvent {
  final double age;

  SignupAgeChanged({required this.age});
}

class SignupUsernameChanged extends SignupEvent {
  final String username;

  SignupUsernameChanged({required this.username});
}

class SignupPasswordChanged extends SignupEvent {
  final String password;

  SignupPasswordChanged({required this.password});
}

class SignupSubmitted extends SignupEvent {
  final SignupState data;

  SignupSubmitted({required this.data});
}
