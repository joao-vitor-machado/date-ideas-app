import '../model/login.dart';

abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  SignupData user;
  Authenticated({required this.user}) {
    print(user);
  }
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
