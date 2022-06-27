import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/monitor_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/monitor_state.dart';
import 'package:trabalho_fibal_mob_2022/model/preferencias/Preferencia.dart';
import 'package:trabalho_fibal_mob_2022/provider/firebase_firestore.dart';
import 'package:trabalho_fibal_mob_2022/widgets/checkbox_widget.dart';
import 'package:trabalho_fibal_mob_2022/widgets/radio_button_widget.dart';
import 'package:trabalho_fibal_mob_2022/widgets/drop_down_widget.dart';

import '../model/preferencias/Preferencias_collection.dart';
import '../model/preferencias/Salgado.dart';
import 'main_screen.dart';

class EditarPreferenciasScreen extends StatelessWidget {
  static const route = "/editar_preferencias";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EditarPreferenciasScreen({Key? key}) : super(key: key);

  List<Salgado> salgados = [
    Salgado(nome: "Salgadinhos"),
    Salgado(nome: "Comida Congelada"),
    Salgado(nome: "Fast Food"),
    Salgado(nome: "Comida Árabe"),
    Salgado(nome: "Comida Japonesa"),
    Salgado(nome: "Comida Italiana"),
    Salgado(nome: "Pizza"),
  ];

  final CheckBox checkBox = CheckBox();
  final RadioButton radioButton1 = RadioButton();
  final RadioButton radioButton2 = RadioButton();
  final DropDown dropDown = const DropDown();

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Scaffold(
        body: BlocBuilder<MonitorBloc, MonitorState>(
            builder: ((context, state) => Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: ListView(children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                child: Icon(
                              Icons.edit,
                              color: tema.primary,
                              size: 40,
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                                child: Text(
                              "Editar",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: tema.primary),
                            )),
                          ],
                        ),
                        Container(
                            child: Text(
                          "Preferências",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: tema.primary),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    titulo(context, "Salgados"),
                    mapList(context, "salgado", salgados),
                    // titulo(context, "Bebidas Alcoolicas?"),
                    // Container(
                    //   child: radioButton1,
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // titulo(context, "Bebidas"),
                    // mapList(context, "bebidaNaoAlc", bebidasNaoAlc),
                    // titulo(context, "Doces"),
                    // mapList(context, "doce", doces),
                    // titulo(context, "Atividades"),
                    // mapList(context, "atividade", atividades),
                    // titulo(context, "Escolher Gênero?"),
                    // Container(
                    //   child: radioButton2,
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // titulo(context, "Gêneros Favoritos"),
                    // Container(
                    //   child: dropDown,
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    submitButton(context),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ))));
  }

  // Widget enableCheckBox() {
  //   return Column(
  //     children: [
  //       Row(
  //         children: [
  //           Transform.scale(scale: 0.8, child: checkBox),
  //           const Text("Cerveja",
  //               style: TextStyle(fontSize: 16, color: Colors.grey)),
  //         ],
  //       ),
  //       Row(
  //         children: [
  //           Transform.scale(scale: 0.8, child: checkBox),
  //           const Text("Whisky",
  //               style: TextStyle(fontSize: 16, color: Colors.grey)),
  //         ],
  //       ),
  //       Row(
  //         children: [
  //           Transform.scale(scale: 0.8, child: checkBox),
  //           const Text("Vinho",
  //               style: TextStyle(fontSize: 16, color: Colors.grey)),
  //         ],
  //       ),
  //       const SizedBox(
  //         height: 20,
  //       ),
  //     ],
  //   );
  // }

  Widget submitButton(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return ElevatedButton(
      child: Container(
        child: Row(
          children: [
            Text(
              "Atualizar",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 20,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.arrow_forward,
                color: tema.secondary,
                size: 20,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, MainScreen.route);
      },
    );
  }

  Widget titulo(BuildContext context, String titulo) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            child: Text(titulo,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: tema.primary))),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget mapList(BuildContext context, String nome, List<Preferencia> lista) {
    final tema = Theme.of(context).colorScheme;

    PreferenciasCollection preferencias =
        BlocProvider.of<MonitorBloc>(context).state.preferencesCollection;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        child: Column(
          children: preferencias.prefList.map((pref) {
            return Row(
              children: [
                CheckBox(
                  isChecked: pref.isPreferencia,
                  func: () {
                    pref.isPreferencia = !pref.isPreferencia;
                  },
                ),
                Text(pref.nome,
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ],
            );
          }).toList(),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}
