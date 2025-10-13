import 'package:flutter/material.dart';

class SeniorCitizenPrincipalCard extends StatelessWidget {
  const SeniorCitizenPrincipalCard({
    super.key,
    required this.names,
    required this.lastnames,
    required this.age,
    required this.healthConditions,
  });
  final String names;
  final String lastnames;
  final int age;
  final List<String> healthConditions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                'Adulto Mayor',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('$names $lastnames'),
                subtitle: Text('Edad: $age años'),
              ),
              ListTile(
                leading: Icon(Icons.health_and_safety),
                title: Text('Condición de salud'),
                subtitle: Text(healthConditions.join(', ')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
