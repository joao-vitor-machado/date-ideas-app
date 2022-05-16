import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/model/login.dart';
import 'package:trabalho_fibal_mob_2022/view/preferencias_screen.dart';
import 'package:trabalho_fibal_mob_2022/widgets/slider_bar_widget.dart';

class CadastroScreen extends StatelessWidget {
  static const route = "/cadastro";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginData loginData =
      LoginData(name: "", age: 0, username: "", password: "");

  final SliderBar sliderBar = const SliderBar();

  CadastroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: tema.background,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: tema.primary),
      body: Container(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: ListView(
            children: [
              Container(
                  child: Text(
                "Bora para um",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: tema.primary),
              )),
              Container(
                  child: Text(
                "DATE?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: tema.primary),
              )),
              Container(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Nome",
                          style: TextStyle(fontSize: 20, color: tema.primary),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      nameFormField(context),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Idade",
                          style: TextStyle(fontSize: 20, color: tema.primary),
                        ),
                      ),
                      //slider
                      sliderBar,
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Username",
                            style: TextStyle(fontSize: 20, color: tema.primary),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      usernameFormField(context),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Senha",
                            style: TextStyle(fontSize: 20, color: tema.primary),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      passwordFormField(context),
                      const SizedBox(
                        height: 30,
                      ),
                      submitButton(context),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget nameFormField(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (String? inValue) {
        loginData.name = inValue ?? "";
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: tema.primary,
        )),
        hintText: "Example Name",
      ),
    );
  }

  Widget usernameFormField(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

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
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: tema.primary,
        )),
        hintText: "Username",
      ),
    );
  }

  Widget passwordFormField(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

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
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: tema.primary,
        )),
        hintText: "******",
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return ElevatedButton(
      child: Container(
        width: 100,
        height: 40,
        child: Row(
          children: const [
            Text("Próximo"),
            SizedBox(
              width: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          loginData.doSomething();
          Navigator.pushNamed(context, PreferenciasScreen.route);
        }
      },
    );
  }
}
