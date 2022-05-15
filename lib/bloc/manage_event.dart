abstract class LoginEvent {}

class LoginNameChanged extends LoginEvent {
  final String name;

  LoginNameChanged({required this.name});
}

class LoginUsernameChanged extends LoginEvent {
  final String username;

  LoginUsernameChanged({required this.username});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginSubmitted extends LoginEvent {}
