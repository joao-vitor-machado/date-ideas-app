import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  RadioButton({Key? key}) : super(key: key);

  Alcohol? _alcohol = Alcohol.sim;
  get alcohol => _alcohol;

  @override
  State<StatefulWidget> createState() {
    return RadioButtonState();
  }
}

enum Alcohol { sim, nao }

class RadioButtonState extends State<RadioButton> {
  //Alcohol? _alcohol = Alcohol.sim;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Sim',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          leading: Radio<Alcohol>(
            activeColor: tema.primary,
            value: Alcohol.sim,
            groupValue: widget.alcohol,
            onChanged: (Alcohol? value) {
              setState(() {
                widget._alcohol = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Não',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          leading: Radio<Alcohol>(
            activeColor: tema.primary,
            value: Alcohol.nao,
            groupValue: widget.alcohol,
            onChanged: (Alcohol? value) {
              setState(() {
                widget._alcohol = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
