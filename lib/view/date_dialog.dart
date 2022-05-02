import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/widgets/date_picker.dart';
import 'package:trabalho_fibal_mob_2022/widgets/number_picker_widget.dart';

import '../model/Date.dart';

class DateDialog extends StatelessWidget {
  DateApp dateApp;
  DateDialog({Key? key, required this.dateApp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    final screen = MediaQuery.of(context).size;

    DateTime data = DateTime.now();

    Widget listElements(List<String> elements) {
      return Column(
        children: elements.map((element) => Text(element)).toList(),
      );
    }

    return SingleChildScrollView(
      child: Dialog(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      child: Icon(
                        Icons.close,
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Seu Date",
                    style: TextStyle(
                      color: tema.primary,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nome",
                    style: TextStyle(fontSize: 12, color: tema.primary),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: dateApp.nome,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: tema.primary, width: 0.0),
                    ),
                    labelText: "Nome",
                    // border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Data",
                    style: TextStyle(fontSize: 12, color: tema.primary),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DatePickerWidget(),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Opções",
                    style: TextStyle(fontSize: 15, color: tema.primary),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Salagado",
                              style: TextStyle(color: tema.primary),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            listElements(dateApp.salgados)
                          ],
                        ),
                        Column(
                          children: [
                            Text("Doces",
                                style: TextStyle(color: tema.primary)),
                            SizedBox(
                              height: 5,
                            ),
                            listElements(dateApp.doces)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("Bebidas",
                                style: TextStyle(color: tema.primary)),
                            SizedBox(
                              height: 5,
                            ),
                            listElements(dateApp.bebidas)
                          ],
                        ),
                        Column(
                          children: [
                            Text("Atividades",
                                style: TextStyle(color: tema.primary)),
                            SizedBox(
                              height: 5,
                            ),
                            listElements(dateApp.atividades)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: tema.primary,
                        minimumSize: const Size(200, 50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Gerar Novamente",
                          style: TextStyle(color: tema.secondary),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.autorenew,
                          color: tema.secondary,
                        ),
                      ],
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
