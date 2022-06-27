import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/storage_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/storage_event.dart';
import 'package:trabalho_fibal_mob_2022/model/preferencias/Preferencias_collection.dart';
import 'package:trabalho_fibal_mob_2022/model/preferencias/Salgado.dart';
import 'package:trabalho_fibal_mob_2022/view/main_screen.dart';
import 'package:trabalho_fibal_mob_2022/widgets/checkbox_widget.dart';
import 'package:trabalho_fibal_mob_2022/widgets/radio_button_widget.dart';
import 'package:trabalho_fibal_mob_2022/widgets/drop_down_widget.dart';
import '../bloc/storage_state.dart';
import '../model/preferencias/Preferencia.dart';

class PreferenciasScreen extends StatelessWidget {
  static const route = "/preferencias";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PreferenciasScreen({Key? key}) : super(key: key);

  final CheckBox checkBox = CheckBox();
  final RadioButton radioButton1 = RadioButton();
  final RadioButton radioButton2 = RadioButton();
  final DropDown dropDown = const DropDown();

  List<Salgado> salgados = [
    Salgado(nome: "Salgadinhos"),
    Salgado(nome: "Comida Congelada"),
    Salgado(nome: "Fast Food"),
    Salgado(nome: "Comida Árabe"),
    Salgado(nome: "Comida Japonesa"),
    Salgado(nome: "Comida Italiana"),
    Salgado(nome: "Pizza"),
  ];

  List<String> bebidasNaoAlc = ["Água", "Suco", "Refrigerante"];

  List<String> bebidasAlc = ["Cerveja", "Vinho", "Destilados"];

  List<String> doces = [
    "Chocolate",
    "Sorvete",
    "Brownie",
    "Cookie",
    "Açaí",
    "Bolo"
  ];

  List<String> atividades = [
    "Ver Filmes",
    "Ver Séries",
    "Ver Animes",
    "Passear no Parque",
    "Fazer Compras",
    "Ir ao Cinema"
  ];

  PreferenciasCollection preferencias = PreferenciasCollection();

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: tema.primary,
        elevation: 0,
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: ListView(children: [
            Container(
                child: Text(
              "Suas Preferências",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: tema.primary),
            )),
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

            BlocBuilder<StorageBloc, StorageState>(
                builder: ((context, state) => submitButton(context))),
            const SizedBox(
              height: 20,
            ),
          ])),
    );
  }

  // Widget enableCheckBox() {
  //   return Column(
  //     children: salgados.map((salgado) {
  //       Preferencias preferencias = Preferencias(name: salgado);
  //       return Row(
  //         children: [
  //           const CheckBox(),
  //           Text(preferencias.name,
  //               style: TextStyle(fontSize: 18, color: Colors.grey)),
  //         ],
  //       );
  //     }).toList(),
  //   );
  // }

  Widget submitButton(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return ElevatedButton(
      child: Container(
        child: Row(
          children: [
            Text(
              "Cadastrar",
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
        BlocProvider.of<StorageBloc>(context)
            .add(SubmitEvent(pref: preferencias));
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

    for (int i = 0; i < lista.length; i++) {
      preferencias.insertPreferenciaOfId(i.toString(), lista[i]);
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        child: Column(
          children: preferencias.prefList.map((pref) {
            return Row(
              children: [
                CheckBox(
                  func: () {
                    pref.isPreferencia = !pref.isPreferencia;
                    print(pref.nome + ":" + pref.isPreferencia.toString());
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
