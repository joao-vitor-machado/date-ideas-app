import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/model/login.dart';

class CadastroScreen extends StatelessWidget {
  static const route = "/cadastro";
  double _currentSliderValue = 18;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginData loginData =
      LoginData(name: "", age: 0, username: "", password: "");

  CadastroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: ListView(
            children: [
              Container(
                  child: const Text(
                "Bora para um",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.deepPurpleAccent),
              )),
              Container(
                  child: const Text(
                "DATE",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.deepPurpleAccent),
              )),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Nome",
                          style: TextStyle(
                              fontSize: 20, color: Colors.deepPurpleAccent),
                        ),
                      ),
                      nameFormField(),
                      const SizedBox(
                        height: 30,
                      ),
                      //slider idade
                      Slider(
                        value: _currentSliderValue,
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                        min: 0,
                        max: 100,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Username",
                            style: TextStyle(
                                fontSize: 20, color: Colors.deepPurpleAccent),
                          )),
                      usernameFormField(),
                      const SizedBox(
                        height: 30,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Senha",
                            style: TextStyle(
                                fontSize: 20, color: Colors.deepPurpleAccent),
                          )),
                      passwordFormField(),
                      const SizedBox(
                        height: 30,
                      ),
                      submitButton(),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget nameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (String? inValue) {
        loginData.name = inValue ?? "";
      },
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.deepPurpleAccent,
        )),
        labelText: "Example Name",
      ),
    );
  }

  Widget usernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira um nome de usuário";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        loginData.username = inValue ?? "";
      },
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.deepPurpleAccent,
        )),
        labelText: "Username",
      ),
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      obscureText: true,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.length < 6) {
            return "Mínimo de 6 letras";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        loginData.password = inValue ?? "";
      },
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.deepPurpleAccent,
        )),
        labelText: "******",
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: const Text("Próximo"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          loginData.doSomething();
        }
      },
    );
  }
}
