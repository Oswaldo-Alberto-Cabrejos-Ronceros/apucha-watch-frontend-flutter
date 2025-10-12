import 'package:apucha_watch_movil/features/auth/presentation/provider/session_data_provider.dart';
import 'package:apucha_watch_movil/features/cared_profile/domain/models/cared_profile_response.dart';
import 'package:apucha_watch_movil/features/cared_profile/presentation/provider/cared_profile_service_provider.dart';
import 'package:apucha_watch_movil/screens/perfil_user/widgets/carer_perfil_card.dart';
import 'package:apucha_watch_movil/screens/perfil_user/widgets/confirm_out_session_alert_dialog.dart';
import 'package:apucha_watch_movil/screens/perfil_user/widgets/senior_citizen_perfil_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PerfilUserScreen extends ConsumerStatefulWidget {
  const PerfilUserScreen({super.key});

  @override
  ConsumerState<PerfilUserScreen> createState() => _PerfilUserScreenState();
}

class _PerfilUserScreenState extends ConsumerState<PerfilUserScreen> {
  //error message
  String? _errorMessague;
  bool _loading = false;
  CaredProfileResponse? _caredProfile;
  //on didChangeDependencies
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchCaredProfile();
  }

  //metodo busca perfil
  Future<void> _fetchCaredProfile() async {
    setState(() {
      _loading = true;
      _errorMessague = null;
    });
    try {
      final sessionData = ref.watch(sessionDataProvider);
      final String userId = sessionData?['userId'];
      if (userId == '') {
        throw Exception('UserId no encontrado en sessionDataProvider');
      }
      final caredProfileService = ref.read(caredProfileServiceProvider);
      final caredProfile = await caredProfileService.findByUserId(userId);
      if (caredProfile == null) {
        throw Exception(
          'No se encontró perfil cuidado para el userId: $userId',
        );
      }
      _caredProfile = caredProfile;
    } catch (e) {
      setState(() {
        _errorMessague = 'Error inesperado $e';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

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
              'Mi Perfil',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => ConfirmOutSessionAlertDialog(),
                );
              },
              label: Text('Cerrar Sesión'),
            ),
          ],
        ),
        _caredProfile == null && _loading
            ? const CircularProgressIndicator()
            : CarerPerfilCard(names: _caredProfile!.name, lastnames: _caredProfile!.lastname),
        if (_errorMessague != null)
          Text(
            _errorMessague ?? 'No se encontró perfil',
            style: const TextStyle(color: Colors.red),
          ),
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
