import 'package:flutter/material.dart';

class SliderBar extends StatefulWidget {
  const SliderBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SliderBarState();
  }
}

class SliderBarState extends State<SliderBar> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double _sliderValue = 18;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Slider(
      activeColor: tema.primary,
      min: 10,
      max: 80,
      value: _sliderValue,
      divisions: 70,
      label: _sliderValue.round().toString(),
      onChanged: (double inValue) {
        setState(() => _sliderValue = inValue);
      },
    );
  }
}
