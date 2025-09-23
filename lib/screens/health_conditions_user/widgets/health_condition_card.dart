import 'package:flutter/material.dart';

class HealthConditionCard extends StatelessWidget {
  const HealthConditionCard({super.key, required this.condition, required this.diagnosisDate, required this.severity});
  final String condition;
  final String diagnosisDate;
  final String severity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: ListTile(
          title: Text(condition),
          subtitle: Row(
            spacing: 4,
            children: [
              Icon(Icons.calendar_month_outlined),
              Text('Diagnóstico: $diagnosisDate'),
            ],
          ),
          trailing: Text(
            severity,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
