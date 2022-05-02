import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:intl/intl.dart';
import 'package:trabalho_fibal_mob_2022/widgets/date_picker.dart';
import 'package:trabalho_fibal_mob_2022/widgets/number_picker_widget.dart';

class NewDateDialog extends StatelessWidget {
  const NewDateDialog({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    final screen = MediaQuery.of(context).size;

    DateTime data = DateTime.now();

    return Dialog(
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
                  child: GestureDetector(child: Icon(Icons.close,),
                    onTap: () => Navigator.pop(context),) ,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Crie seu Date",
                  style: TextStyle(
                    color: tema.primary,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    fontSize: 24,
                  ),),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nome",
                  style: TextStyle(
                      fontSize: 12, color: tema.primary),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:  BorderSide(color: tema.primary, width: 0.0),
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
                  style: TextStyle(
                      fontSize: 12, color: tema.primary),
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
                  style: TextStyle(
                      fontSize: 15, color: tema.primary),
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
                          Text("Salagado"),
                          SizedBox(
                            height: 5,
                          ),
                          NumberPickerWidget()
                        ],
                      ),
                      Column(
                        children: [
                          Text("Doces"),
                          SizedBox(
                            height: 5,
                          ),
                          NumberPickerWidget()
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
                          Text("Bebidas"),
                          SizedBox(
                            height: 5,
                          ),
                          NumberPickerWidget()
                        ],
                      ),
                      Column(
                        children: [
                          Text("Atividades"),
                          SizedBox(
                            height: 5,
                          ),
                          NumberPickerWidget()
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
                      minimumSize: const Size(
                          200, 50
                      )
                  ),
                  child: Text("Criar",
                    style: TextStyle(
                        color: tema.secondary
                    ),),
                  onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
