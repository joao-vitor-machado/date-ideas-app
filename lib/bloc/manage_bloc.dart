import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_event.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_state.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_submission.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEvent>(_onEvent);
  }

  @override
  Future<void> _onEvent(LoginEvent event, Emitter<LoginState> emit) async {
    //name updated
    if (event is LoginNameChanged) {
      emit(state.copyWith(name: event.name));

      //username updated
    } else if (event is LoginAgeChanged) {
      emit(state.copyWith(age: event.age));

      //password updated
    } else if (event is LoginUsernameChanged) {
      emit(state.copyWith(username: event.username));

      //password updated
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));

      //form submitted
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));
    }

    try {
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      //emit(state.copyWith(formStatus: SubmissionFailed(e)));
      print(e);
    }
  }
}
