import 'package:trabalho_fibal_mob_2022/bloc/manage_submission.dart';

class LoginState {
  final String name;
  bool get isValidName => name.isNotEmpty;

  final double age;

  final String username;
  bool get isValidUsername => username.isNotEmpty;

  final String password;
  bool get isValidPassword => password.length > 5;

  final FormSubmissionStatus formStatus;

  LoginState({
    this.name = "",
    this.age = 0,
    this.username = "",
    this.password = "",
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? name,
    double? age,
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      name: name ?? this.name,
      age: age ?? this.age,
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
