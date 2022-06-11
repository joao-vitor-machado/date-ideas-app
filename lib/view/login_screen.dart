import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/auth_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/auth_event.dart';
import 'package:trabalho_fibal_mob_2022/view/cadastro_screen.dart';
import 'package:trabalho_fibal_mob_2022/view/main_screen.dart';

class LoginScreen extends StatefulWidget {
  static const route = "/";
  LoginScreen({Key? key}) : super(key: key);
  var username = TextEditingController();
  var password = TextEditingController();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context);
    final tema = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/logo_v1.png")),
                  Text(
                    "Snacks n' Date",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 40,
                      color: tema.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: screen.size.width * 0.8,
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: tema.primary),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          prefixIcon: Icon(Icons.account_circle),
                          labelText: "Email",
                          border: OutlineInputBorder()),
                      controller: widget.username,
                    ),
                    SizedBox(
                      height: screen.size.height * 0.02,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: tema.primary, width: 0.0),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          labelText: "password",
                          border: OutlineInputBorder()),
                      controller: widget.password,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, CadastroScreen.route),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Não possui cadastro ainda?",
                              style: TextStyle(color: Colors.lightBlue),
                            ),
                          )),
                    ),
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: tema.primary,
                            minimumSize: const Size(200, 50)),
                        child: Text(
                          "Login",
                          style: TextStyle(color: tema.secondary),
                        ),
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(LoginUser(
                              username: widget.username.text,
                              password: widget.password.text));
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
