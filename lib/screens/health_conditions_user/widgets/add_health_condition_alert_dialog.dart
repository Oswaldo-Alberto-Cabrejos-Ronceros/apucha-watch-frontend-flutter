import 'package:flutter/material.dart';

class AddHealthConditionAlertDialog extends StatefulWidget {
  const AddHealthConditionAlertDialog({super.key});

  @override
  State<AddHealthConditionAlertDialog> createState() =>
      _AddHealthConditionAlertDialogState();
}

class _AddHealthConditionAlertDialogState
    extends State<AddHealthConditionAlertDialog> {
  String condition = '';
  String severity = '';
  DateTime? diagnosisDate;
  final List<String> conditions = [
    'Hipertensión',
    'Diabetes',
    'Asma',
    'Alergias',
  ];
  final List<String> severities = ['Leve', 'Moderada', 'Severa'];
  //for date picket
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Agregar Condición de Salud'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Condición'),
            items: conditions
                .map((cond) => DropdownMenuItem(value: cond, child: Text(cond)))
                .toList(),
            onChanged: (value) {
              setState(() {
                condition = value ?? '';
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Fecha de Diagnóstico',
              suffixIcon: Icon(Icons.calendar_today),
            ),
            readOnly: true,
            controller: _dateController,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  diagnosisDate = pickedDate;
                  _dateController.text =
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                });
              }
            },
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Severidad'),
            items: severities
                .map((sev) => DropdownMenuItem(value: sev, child: Text(sev)))
                .toList(),
            onChanged: (value) {
              setState(() {
                severity = value ?? '';
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (condition.isNotEmpty &&
                diagnosisDate != null &&
                severity.isNotEmpty) {
              Navigator.of(context).pop();
            } else {}
          },
          child: Text('Guardar'),
        ),
      ],
    );
  }
}
