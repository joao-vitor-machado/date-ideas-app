import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';

class NumberPickerWidget extends StatelessWidget {
  const NumberPickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: tema.primary,
        )
      ),
      child: CustomNumberPicker(
        initialValue: 1,
        maxValue: 5,
        minValue: 0,
        step: 1,
        enable: true,
        customAddButton: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(Icons.add, size: 20, color: tema.primary,),
        ),
        customMinusButton: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.remove, size: 20, color: tema.primary,),
        ),

        onValue: (value) {
          print(value.toString());
        },
      ),
    );
  }
}
