import 'package:apucha_watch_movil/screens/dashboard_user/widgets/location_card.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/widgets/senior_citizen_principal_card.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/widgets/status_device_card.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/widgets/vital_signs_card.dart';
import 'package:flutter/material.dart';

class DashboardUserScreen extends StatelessWidget {
  const DashboardUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Bienvenido de nuevo, Oswaldo!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SeniorCitizenPrincipalCard(),
        VitalSignsCard(),
        LocationCard(
          location: 'Av. Siempre Viva 123, Springfield',
          ago: 'Hace 2 minutos',
        ),
        StatusDeviceCard(),
      ],
    );
  }
}
