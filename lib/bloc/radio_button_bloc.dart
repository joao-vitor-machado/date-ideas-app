import 'package:bloc/bloc.dart';

class RadioButtonBloc extends Bloc<RadioButtonEvent, RadioButtonState> {
  RadioButtonBloc(RadioButtonState initialState) : super(initialState) {
    on<Disabled>((event, emit) => emit(RadioButtonState(estado: false)));
    on<Enabled>((event, emit) => emit(RadioButtonState(estado: true)));
  }
}

class RadioButtonState {
  bool estado;
  RadioButtonState({this.estado = false});
}

abstract class RadioButtonEvent {}

class Disabled extends RadioButtonEvent {}

class Enabled extends RadioButtonEvent {}
