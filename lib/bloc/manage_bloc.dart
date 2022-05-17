import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_event.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_state.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_submission.dart';

import '../provider/rest_provider.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState()) {
    on<SignupEvent>(_onEvent);
  }

  @override
  Future<void> _onEvent(SignupEvent event, Emitter<SignupState> emit) async {
    //name updated
    if (event is SignupNameChanged) {
      emit(state.copyWith(name: event.name));

      //username updated
    } else if (event is SignupAgeChanged) {
      emit(state.copyWith(age: event.age));

      //password updated
    } else if (event is SignupUsernameChanged) {
      emit(state.copyWith(username: event.username));

      //password updated
    } else if (event is SignupPasswordChanged) {
      emit(state.copyWith(password: event.password));

      //form submitted
    } else if (event is SignupSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));
      RestServer.helper.insertSignupData(state);
    }

    try {
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      //emit(state.copyWith(formStatus: SubmissionFailed(e)));
      print(e);
    }
  }
}
