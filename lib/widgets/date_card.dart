import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/model/Date.dart';

class DateCard extends StatelessWidget {
  final DateApp dateApp;
  const DateCard({Key? key, required this.dateApp}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    final screen = MediaQuery.of(context).size;

    Widget dateElementsListGenerate(List<String> list){
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list.map((element) => Text(element, style: TextStyle(color: tema.secondary),)).toList(),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(

            height: screen.height * 0.2,
            width: screen.width * 0.85,
            decoration: BoxDecoration(
              color: tema.primary,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                    Row(
                      children: [Text("Nome do Date",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: tema.secondary,
                        fontFamily: "Roboto",
                      ),)],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Salgados",
                              style: TextStyle(
                                color: tema.secondary,
                                fontWeight: FontWeight.bold
                              ),),
                              dateElementsListGenerate(dateApp.salgados),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Doces",
                                style: TextStyle(
                                    color: tema.secondary,
                                    fontWeight: FontWeight.bold
                                ),),
                              dateElementsListGenerate(dateApp.doces)
                            ],
                          ),
                          Column(
                            children: [
                              Text("Bebidas",
                                style: TextStyle(
                                    color: tema.secondary,
                                    fontWeight: FontWeight.bold
                                ),),
                              dateElementsListGenerate(dateApp.bebidas)
                            ],
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
