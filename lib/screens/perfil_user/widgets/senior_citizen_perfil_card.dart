import 'package:flutter/material.dart';

class SeniorCitizenPerfilCard extends StatelessWidget {
  const SeniorCitizenPerfilCard({
    super.key,
    required this.names,
    required this.lastnames,
    required this.age,
    required this.birthDate,
  });
  final String names;
  final String lastnames;
  final int age;
  final DateTime birthDate;

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
            onPressed: () {},
            child: Icon(Icons.edit),
          ),
        ),
      ),
    );
  }
}
