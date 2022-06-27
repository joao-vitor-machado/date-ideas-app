import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  Function? func;
  bool isChecked;

  CheckBox({Key? key, Function? this.func, bool this.isChecked = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CheckBoxState();
  }
}

class CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey;
      }
      return tema.primary;
    }

    return Checkbox(
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: widget.isChecked,
      onChanged: (bool? value) {
        setState(() => widget.isChecked = value!);
        if (widget.func != null) {
          widget.func!();
        }
      },
    );
  }
}
