class LoginData {
  String name;
  double age;
  String username;
  String password;

  bool confirmed = false;

  LoginData(
      {required this.name,
      required this.age,
      required this.username,
      required this.password});

  doSomething() {
    print("Name: $name");
    print("Age: $age");
    print("Username: $username");
    print("Password: $password");
  }
}
