import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  DateTime data = DateTime.now();
  DatePickerWidget({Key? key}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: widget.data,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != widget.data) {
        setState(() {
          widget.data = picked;
        });
      }
    }

    return Row(
      children: [
        Text(
          DateFormat("dd/MM/yyyy").format(widget.data),
          style: TextStyle(color: tema.tertiary, fontSize: 20),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
            child: Icon(
              Icons.edit,
              color: tema.primary,
              size: 20,
            ),
            onTap: () => _selectDate(context)),
      ],
    );
  }
}
