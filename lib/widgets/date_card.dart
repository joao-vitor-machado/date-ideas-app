import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/model/Date.dart';
import 'package:trabalho_fibal_mob_2022/view/date_dialog.dart';

import '../model/mock/dates_mock.dart';

class DateCard extends StatelessWidget {
  final DateApp dateApp;
  const DateCard({Key? key, required this.dateApp}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final tema = Theme.of(context).colorScheme;


    Widget dateElementsListGenerate(List<String> list){
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list.map((element) => Text(element, style: TextStyle(color: tema.secondary),)).toList(),
      );
    }

    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context) => DateDialog(dateApp: dateApp,));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height: screen.height * 0.2,
              width: screen.width * 0.75,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [tema.primary, Colors.deepPurpleAccent],),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                      Row(
                        children: [Text(dateApp.nome,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
