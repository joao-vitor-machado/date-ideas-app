import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/widgets/date_card.dart';
import 'package:trabalho_fibal_mob_2022/model/mock/dates_mock.dart';

class MainScreen extends StatelessWidget {
  static const route = "/mainScreen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Text("djfsdfl"),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: tema.primary,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Olá, Fulano!",
            style: TextStyle(
              color: tema.primary,
              fontFamily: "Roboto",
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Dates de hoje:",
            style: TextStyle(
              color: tema.primary,
              fontSize: 24,
              fontWeight: FontWeight.w700
            ),),
          ),
          Container(
            height: screen.height * 0.25,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                DateCard(dateApp: DateMock.dates.first),
                DateCard(dateApp: DateMock.dates.first),
                DateCard(dateApp: DateMock.dates.first),
                DateCard(dateApp: DateMock.dates.first),
                DateCard(dateApp: DateMock.dates.first),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Próximos Dates:",
              style: TextStyle(
                  color: tema.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.w700
              ),),
          ),
          Container(
            height: screen.height * 0.45,
            child: ListView(
              children: DateMock.dates.map((element) => ListTile(
                title: Text(element.nome),
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}
