import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/monitor_event.dart';
import 'package:trabalho_fibal_mob_2022/model/preferencias/Preferencias_collection.dart';
import '../provider/firebase_firestore.dart';
import 'monitor_state.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  PreferenciasCollection preferences = PreferenciasCollection();

  MonitorBloc()
      : super(MonitorState(preferencesCollection: PreferenciasCollection())) {
    // Leitura da Stream:
    FirestoreServer.helper.stream.listen((event) {
      preferences = event;
      add(UpdateList());
    });

    on<AskNewList>((event, emit) async {
      preferences = await FirestoreServer.helper.getPreferenciasList();
      emit(MonitorState(preferencesCollection: preferences));
    });

    on<UpdateList>((event, emit) {
      emit(MonitorState(preferencesCollection: preferences));
    });

    add(AskNewList());
  }
}
