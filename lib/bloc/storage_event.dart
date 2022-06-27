import 'package:trabalho_fibal_mob_2022/model/preferencias/Preferencia.dart';
import 'package:trabalho_fibal_mob_2022/model/preferencias/Preferencias_collection.dart';

abstract class StorageEvent {}

class SubmitEvent extends StorageEvent {
  PreferenciasCollection pref;
  SubmitEvent({required this.pref});
}

class DeleteEvent extends StorageEvent {
  String prefId;
  DeleteEvent({required this.prefId});
}

class UpdateCancel extends StorageEvent {}
