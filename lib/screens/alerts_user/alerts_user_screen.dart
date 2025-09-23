import 'package:apucha_watch_movil/screens/alerts_user/widgets/alert_card.dart';
import 'package:flutter/material.dart';

class AlertsUserScreen extends StatelessWidget {
  const AlertsUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Historial de Alertas',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        AlertCard(
          icon: Icons.info,
          color: Colors.red,
          title: 'Posible caida',
          subtitle: 'Hace 2 horas',
        ),
        AlertCard(
          icon: Icons.monitor_heart_sharp,
          color: Colors.amber,
          title: 'Frecuencia cardíaca alta',
          subtitle: 'Hace 1 horas',
        ),
      ],
    );
  }
}
