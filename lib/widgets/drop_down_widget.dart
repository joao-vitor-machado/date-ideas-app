import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DropDownState();
  }
}

class DropDownState extends State<DropDown> {
  String dropDownValue1 = 'Terror';
  String dropDownValue2 = 'Terror';
  String dropDownValue3 = 'Terror';

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Container(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: tema.primary, style: BorderStyle.solid, width: 0.50),
            ),
            child: DropdownButton<String>(
              value: dropDownValue1,
              icon: const Icon(Icons.expand_more),
              elevation: 16,
              style: const TextStyle(fontSize: 15, color: Colors.grey),
              onChanged: (String? newValue) {
                setState(() {
                  dropDownValue1 = newValue!;
                });
              },
              items: <String>['Terror', 'Romance', 'Comédia', 'Ação']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: tema.primary, style: BorderStyle.solid, width: 0.50),
            ),
            child: DropdownButton<String>(
              value: dropDownValue2,
              icon: const Icon(Icons.expand_more),
              elevation: 16,
              style: const TextStyle(fontSize: 15, color: Colors.grey),
              onChanged: (String? newValue) {
                setState(() {
                  dropDownValue2 = newValue!;
                });
              },
              items: <String>['Terror', 'Romance', 'Comédia', 'Ação']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: tema.primary, style: BorderStyle.solid, width: 0.50),
            ),
            child: DropdownButton<String>(
              value: dropDownValue3,
              icon: const Icon(Icons.expand_more),
              elevation: 16,
              style: const TextStyle(fontSize: 15, color: Colors.grey),
              onChanged: (String? newValue) {
                setState(() {
                  dropDownValue3 = newValue!;
                });
              },
              items: <String>['Terror', 'Romance', 'Comédia', 'Ação']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
