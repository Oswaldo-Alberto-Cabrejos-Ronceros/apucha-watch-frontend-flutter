import 'package:apucha_watch_movil/screens/dashboard_user/widgets/location_card.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/widgets/metric_card.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/widgets/status_device_card.dart';
import 'package:flutter/material.dart';

class DashboardUserScreen extends StatelessWidget {
  const DashboardUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text('Bienvenido de nuevo, Oswaldo!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
        Text(
          'Signos vitales',
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
        LocationCard(
          location: 'Av. Siempre Viva 123, Springfield',
          ago: 'Hace 2 minutos',
        ),
        StatusDeviceCard(),
      ],
    );
  }
}
