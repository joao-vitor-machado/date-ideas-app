import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/view/cadastro_screen.dart';
import 'package:trabalho_fibal_mob_2022/view/main_screen.dart';

class LoginScreen extends StatelessWidget {
  static const route = "/";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context);
    final tema = Theme.of(context).colorScheme;
    final GlobalKey _key = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: tema.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageAndTitle(context),
            Container(
              width: screen.size.width * 0.8,
              child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      _formField(
                          context, "username", Icon(Icons.account_circle)),
                      _formField(context, "password", Icon(Icons.lock)),
                      _naoPossuiCadastro(context),
                    ],
                  )),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: tema.background,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
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
                  //   if (_key.currentState!.validate()) {
                  //     _key.currentState!.save();

                  // }
                  Navigator.pushNamed(context, MainScreen.route);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formField(BuildContext context, String label, Icon icon) {
    final screen = MediaQuery.of(context).size;
    final tema = Theme.of(context).colorScheme;
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: tema.primary),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              prefixIcon: Icon(Icons.account_circle),
              labelText: "username",
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: screen.height * 0.02,
        ),
      ],
    );
  }

  Widget _imageAndTitle(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        SizedBox(
          height: screen.height * 0.02,
        ),
        Column(
          children: [
            Container(
                alignment: Alignment.center, child: Image.asset("logo_v1.png")),
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
      ],
    );
  }

  Widget _naoPossuiCadastro(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, CadastroScreen.route),
        child: Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            "Não possui cadastro ainda?",
            style: TextStyle(color: Colors.lightBlue),
          ),
        ));
  }
}
