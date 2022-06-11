class SignupData {
  String _uuid = "";
  String _name = "";
  double _age = 0;
  String _username = "";
  String _password = "";

  bool confirmed = false;

  SignupData({uuid = ""}) {
    _uuid = uuid == null ? "" : uuid;
    _name = "";
    _age = 0;
    _username = "";
    _password = "";
  }

  SignupData.fromMap(map) {
    _uuid = map["uuid"];
    _name = map["name"];
    _age = map["age"];
    _username = map["username"];
    _password = map["password"];
  }

  String get uuid => _uuid;
  String get name => _name;
  double get age => _age;
  String get username => _username;
  String get password => _password;

  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    }
  }

  set age(double newAge) {
    if (newAge > 0) {
      _age = newAge;
    }
  }

  set username(String newUserame) {
    if (newUserame.isNotEmpty) {
      _username = newUserame;
    }
  }

  set password(String newPassword) {
    if (newPassword.isNotEmpty) {
      _password = newPassword;
    }
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["name"] = _name;
    map["age"] = _age;
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }

  // signupData(
  //     {required this.name,
  //     required this.age,
  //     required this.username,
  //     required this.password});

  // doSomething() {
  //   print("Name: $name");
  //   print("Age: $age");
  //   print("Username: $username");
  //   print("Password: $password");
  // }
}
