import 'package:apucha_watch_movil/screens/dashboard_user/widgets/metric_card.dart';
import 'package:flutter/material.dart';

class VitalSignsCard extends StatelessWidget {
  const VitalSignsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                'Signos Vitales',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                spacing: 8,
                children: [
                  MetricCard(
                    value: '72',
                    label: 'BPM',
                    title: 'Frecuencia cardíaca',
                    color: Colors.red,
                  ),
                  MetricCard(
                    value: '120/80',
                    label: 'mmHg',
                    title: 'Presión arterial',
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
