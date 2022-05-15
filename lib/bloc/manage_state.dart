import 'package:trabalho_fibal_mob_2022/bloc/manage_submission.dart';

class LoginState {
  final String name;
  bool get isValidName => name.isNotEmpty;

  final String username;
  bool get isValidUsername => username.isNotEmpty;

  final String password;
  bool get isValidPassword => password.length > 5;

  final FormSubmissionStatus formStatus;

  LoginState({
    this.name = "",
    this.username = "",
    this.password = "",
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? name,
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      name: name ?? this.name,
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
