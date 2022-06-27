import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/storage_event.dart';
import 'package:trabalho_fibal_mob_2022/bloc/storage_state.dart';
import '../provider/firebase_firestore.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {
  StorageBloc() : super(InsertState()) {
    on<SubmitEvent>((event, emit) {
      if (state is InsertState) {
        FirestoreServer.helper.inserePreferencia(event.pref);
      }
    });
    on<DeleteEvent>((event, emit) {
      FirestoreServer.helper.deletePreferencia(event.prefId);
    });
  }
}
