import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/switch_bloc/switch_events.dart';
import 'package:trabalho_fibal_mob_2022/bloc/switch_bloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc(SwitchState initialState) : super(initialState) {
    // on<SelectedSwitch>((event, emit) => SwitchState(selected: true));
    on<SelectedSwitch>((event, emit) {
      emit(SwitchState(selected: true));
    });
    on<UnselectedSwitch>((event, emit) => emit(SwitchState(selected: false)));
  }
}
