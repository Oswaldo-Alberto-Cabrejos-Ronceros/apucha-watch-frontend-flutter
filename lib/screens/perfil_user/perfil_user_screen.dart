import 'package:apucha_watch_movil/screens/perfil_user/widgets/carer_perfil_card.dart';
import 'package:apucha_watch_movil/screens/perfil_user/widgets/senior_citizen_perfil_card.dart';
import 'package:flutter/material.dart';

class PerfilUserScreen extends StatelessWidget {
  const PerfilUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Mi Perfil',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        CarerPerfilCard(names: 'Juan Marcos', lastnames: 'Pérez Vásquez'),
        Text(
          'Perfil del Adulto Mayor',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SeniorCitizenPerfilCard(
          names: 'Carmen Karla',
          lastnames: 'Vásquez Lopez',
          age: 75,
          birthDate: DateTime(1948, 5, 20),
        ),
      ],
    );
  }
}
