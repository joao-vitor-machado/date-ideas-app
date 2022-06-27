class Preferencia {
  String _nome = "";
  bool _isPreferencia = false;

  Preferencia() {
    _nome = "";
    _isPreferencia = false;
  }

  Preferencia.withData({nome = "", isPreferencia = false});

  Preferencia.fromMap(map) {
    print(map);
    _nome = map['nome'];
    _isPreferencia = map['isPreferencia'];
  }

  Map toMap() {
    Map map = Map<String, dynamic>();
    map["nome"] = _nome;
    map["isPreferencia"] = _isPreferencia;

    return map;
  }

  String get nome => _nome;
  bool get isPreferencia => _isPreferencia;

  set nome(String nome) {
    _nome = nome;
  }

  set isPreferencia(bool isPref) {
    _isPreferencia = isPref;
  }
}
