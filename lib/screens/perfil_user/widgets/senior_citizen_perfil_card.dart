import 'package:flutter/material.dart';

class SeniorCitizenPerfilCard extends StatelessWidget {
  const SeniorCitizenPerfilCard({
    super.key,
    required this.seniorCitizenId,
    required this.names,
    required this.lastnames,
    required this.age,
    required this.birthDate,
    required this.onEditar,
  });
  final int seniorCitizenId;
  final String names;
  final String lastnames;
  final int age;
  final DateTime birthDate;
  final Function(int, String, String, DateTime) onEditar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: ListTile(
          leading: Icon(Icons.elderly, size: 40),
          title: Text('$names $lastnames'),
          subtitle: Row(
            spacing: 4,
            children: [
              Icon(Icons.calendar_month_outlined),
              Text(birthDate.toString().split(' ')[0]),
              Text('-'),
              Text('Edad: $age años'),
            ],
          ),
          trailing: FloatingActionButton.small(
            onPressed: () {
              onEditar(seniorCitizenId, names, lastnames, birthDate);
            },
            child: Icon(Icons.edit),
          ),
        ),
      ),
    );
  }
}
