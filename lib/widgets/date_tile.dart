import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/Date.dart';
import '../view/date_dialog.dart';

class DateTile extends StatelessWidget {
  final DateApp dataApp;

  const DateTile({Key? key, required this.dataApp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;


    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context) => DateDialog(dateApp: dataApp,));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: tema.primary,
              style: BorderStyle.solid
            )
          ),
          child: ListTile(
            title: Text(dataApp.nome,
            style: TextStyle(
              color: tema.primary,
              fontFamily: "Roboto",
              fontSize: 15
            ),),
            trailing: Text(DateFormat("dd/MM/yyyy").format(dataApp.data),
            style: TextStyle(
              color: tema.tertiary,
              fontFamily: "Roboto"
            ),),
          ),
        ),
      ),
    );
  }
}
