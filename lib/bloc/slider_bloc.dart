import 'package:bloc/bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/slider_event.dart';
import 'package:trabalho_fibal_mob_2022/bloc/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc(SliderState initialState) : super(initialState) {
    on<ChangeNumber>(
        (event, emit) => emit(SliderState(sliderValue: event.value)));
  }
}
