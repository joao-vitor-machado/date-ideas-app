import 'package:bloc/bloc.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc(SliderState initialState) : super(initialState) {
    on<minor>((event, emit) => emit(SliderState(age: false)));
    on<major>((event, emit) => emit(SliderState(age: true)));
  }
}

class SliderState {
  bool age;
  SliderState({this.age = true});
}

abstract class SliderEvent {}

class minor extends SliderEvent {}

class major extends SliderEvent {}
