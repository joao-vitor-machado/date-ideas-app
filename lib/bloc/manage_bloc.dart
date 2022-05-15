import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_event.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_state.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_submission.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {}

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    //name updated
    if (event is LoginNameChanged) {
      yield state.copyWith(name: event.name);

      //username updated
    } else if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);

      //password updated
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);

      //form submitted
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());
    }
  }
}
