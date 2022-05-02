import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/widgets/checkbox_widget.dart';
import 'package:trabalho_fibal_mob_2022/widgets/radio_button_widget.dart';
import 'package:trabalho_fibal_mob_2022/widgets/drop_down_widget.dart';

class EditarPreferenciasScreen extends StatelessWidget {
  static const route = "/editar_preferencias";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EditarPreferenciasScreen({Key? key}) : super(key: key);

  final CheckBox checkBox = const CheckBox();
  final RadioButton radioButton1 = RadioButton();
  final RadioButton radioButton2 = RadioButton();
  final DropDown dropDown = const DropDown();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: ListView(children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                        child: const Icon(
                      Icons.edit,
                      color: Colors.deepPurpleAccent,
                      size: 40,
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        child: const Text(
                      "Editar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.deepPurpleAccent),
                    )),
                  ],
                ),
                Container(
                    child: const Text(
                  "Preferências",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.deepPurpleAccent),
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: const Text("Salgados",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurpleAccent))),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Salgadinhos",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Comida Congelada",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Fast Food",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Comida Árabe",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Comida Japonesa",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Comida Italiana",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Pizza",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text("Bebidas Alcoolicas?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurpleAccent)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: radioButton1,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: const Text("Bebidas",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurpleAccent))),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Água",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Suco",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Refrigerante",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  enableCheckBox(),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: const Text("Doces",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurpleAccent))),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Chocolate",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Sorvete",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Brownie",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Cookie",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Açaí",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Bolo",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: const Text("Atividades",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurpleAccent))),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Ver Filmes",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Ver Séries",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Ver Animes",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Passear no Parque",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Fazer Compras",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(scale: 0.8, child: checkBox),
                      const Text("Ir ao Cinema",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: const Text("Escolher Gênero?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurpleAccent))),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: radioButton2,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: const Text("Gêneros Favoritos",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurpleAccent))),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: dropDown,
            ),
            const SizedBox(
              height: 20,
            ),
            submitButton(),
            const SizedBox(
              height: 20,
            ),
          ])),
    );
  }

  Widget enableCheckBox() {
    return Column(
      children: [
        Row(
          children: [
            Transform.scale(scale: 0.8, child: checkBox),
            const Text("Cerveja",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
        Row(
          children: [
            Transform.scale(scale: 0.8, child: checkBox),
            const Text("Whisky",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
        Row(
          children: [
            Transform.scale(scale: 0.8, child: checkBox),
            const Text("Vinho",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: Container(
        width: 100,
        height: 20,
        child: Row(
          children: const [
            Text(
              "Atualizar",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 20,
            ),
            Align(
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
        }
      },
    );
  }
}
