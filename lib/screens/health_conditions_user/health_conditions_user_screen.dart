import 'package:apucha_watch_movil/screens/health_conditions_user/widgets/add_health_condition_alert_dialog.dart';
import 'package:apucha_watch_movil/screens/health_conditions_user/widgets/health_condition_card.dart';
import 'package:flutter/material.dart';

class HealthConditionsUserScreen extends StatefulWidget {
  const HealthConditionsUserScreen({super.key});

  @override
  State<HealthConditionsUserScreen> createState() =>
      _HealthConditionsUserScreenState();
}

class _HealthConditionsUserScreenState
    extends State<HealthConditionsUserScreen> {
  //error message
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Condiciones de Salud',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            FloatingActionButton.small(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddHealthConditionAlertDialog( seniorCitizenId: 1),
                );
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
        HealthConditionCard(
          condition: 'Hipertensión',
          diagnosisDate: '2020',
          severity: 'Severa',
        ),
        HealthConditionCard(
          condition: 'Diabetes',
          diagnosisDate: '2018',
          severity: 'Moderada',
        ),
      ],
    );
  }
}
