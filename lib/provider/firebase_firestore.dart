import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trabalho_fibal_mob_2022/model/preferencias/Preferencia.dart';
import 'package:trabalho_fibal_mob_2022/model/preferencias/Preferencias_collection.dart';

class FirestoreServer {
  // Atributo que irá afunilar todas as consultas
  static FirestoreServer helper = FirestoreServer._createInstance();
  // Construtor privado
  FirestoreServer._createInstance();

  // uid do usuário logado
  String? uid;

  // Ponto de acesso com o servidor
  final CollectionReference preferencias =
      FirebaseFirestore.instance.collection("preferencias");

  Future<PreferenciasCollection> getPreferencia(preferenciasID) async {
    DocumentSnapshot document = await preferencias
        .doc(uid)
        .collection("minhas_preferencias")
        .doc(preferenciasID)
        .get();
    PreferenciasCollection preferenciasRet =
        PreferenciasCollection.fromMap(document.data());
    return preferenciasRet;
  }

  Future<int> inserePreferencia(PreferenciasCollection pref) async {
    await preferencias.doc(uid).collection("minhas_preferencias").add(
        {"idList": pref.idList, "prefList": pref.preferenciasFromListToMap()});
    return 42;
  }

  Future<int> updatePreferencia(prefID, Preferencia pref) async {
    await preferencias
        .doc(uid)
        .collection("minhas_preferencias")
        .doc(prefID)
        .update({"nome": pref.nome, "isPreferencia": pref.isPreferencia});
    return 42;
  }

  Future<int> deletePreferencia(prefID) async {
    await preferencias
        .doc(uid)
        .collection("minhas_preferencias")
        .doc(prefID)
        .delete();
    return 42;
  }

  PreferenciasCollection _preferenciasListFromSnapshot(QuerySnapshot snapshot) {
    PreferenciasCollection prefCollection;
    for (var doc in snapshot.docs) {
      // print(doc.data());
      prefCollection = PreferenciasCollection.fromMap(doc.data());
      return prefCollection;
    }

    return PreferenciasCollection();
  }

  Future<PreferenciasCollection> getPreferenciasList() async {
    QuerySnapshot snapshot =
        await preferencias.doc(uid).collection("minhas_preferencias").get();

    return _preferenciasListFromSnapshot(snapshot);
  }

  Stream get stream {
    return preferencias
        .doc(uid)
        .collection("minhas_preferencias")
        .snapshots()
        .map(_preferenciasListFromSnapshot);
  }
}
