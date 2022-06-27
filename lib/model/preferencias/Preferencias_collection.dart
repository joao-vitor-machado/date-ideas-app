import 'package:trabalho_fibal_mob_2022/model/preferencias/Preferencia.dart';

class PreferenciasCollection {
  List idList = [];
  List<Preferencia> prefList = [];

  PreferenciasCollection() {
    idList = [];
    prefList = [];
  }

  int length() {
    return idList.length;
  }

  Preferencia getPreferenciaIndex(int index) {
    return prefList[index];
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }
    return -1;
  }

  updateOrInsertPreferenciaOfId(String id, Preferencia pref) {
    int index = getIndexOfId(id);
    if (index != -1) {
      prefList[index] = pref;
    } else {
      idList.add(id);
      prefList.add(pref);
    }
  }

  updatePreferenciaOfId(String id, Preferencia pref) {
    int index = getIndexOfId(id);
    if (index != -1) {
      prefList[index] = pref;
    }
  }

  deletePreferenciaOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      prefList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertPreferenciaOfId(String id, Preferencia pref) {
    idList.add(id);
    prefList.add(pref);
  }

  cleanPreferencias() {
    for (int i = 0; i < prefList.length; i++) {
      if (prefList[i].isPreferencia == false) {
        deletePreferenciaOfId(idList[i]);
      }
    }
  }

  List<Map> preferenciasFromListToMap() {
    List<Map> list = [];

    prefList.forEach((preferencia) {
      list.add(preferencia.toMap());
    });

    return list;
  }

  PreferenciasCollection.fromMap(map) {
    idList = map["idList"];
    print(map["prefList"]);
    List preferencesListMap = map["prefList"];

    prefList = [];
    preferencesListMap.forEach((prefMap) {
      prefList.add(Preferencia.fromMap(prefMap));
    });
  }

  Map toMap() {
    Map map = Map();

    map["idList"] = idList;
    map["prefList"] = preferenciasFromListToMap();

    return map;
  }
}
