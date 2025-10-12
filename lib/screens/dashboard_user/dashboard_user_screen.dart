import 'package:apucha_watch_movil/features/auth/presentation/provider/session_data_provider.dart';
import 'package:apucha_watch_movil/features/cared_profile/domain/models/cared_profile_response.dart';
import 'package:apucha_watch_movil/features/cared_profile/presentation/provider/cared_profile_service_provider.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/widgets/location_card.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/widgets/senior_citizen_principal_card.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/widgets/status_device_card.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/widgets/vital_signs_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardUserScreen extends ConsumerStatefulWidget {
  const DashboardUserScreen({super.key});

  @override
  ConsumerState<DashboardUserScreen> createState() =>
      _DashboardUserScreenState();
}

class _DashboardUserScreenState extends ConsumerState<DashboardUserScreen> {
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
          _caredProfile == null && _loading
              ? const CircularProgressIndicator()
              : Text(
                  'Bienvenido de nuevo, ${_caredProfile!.name}!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
        if (_errorMessague != null)
          Text(
            _errorMessague ?? 'No se encontró perfil',
            style: const TextStyle(color: Colors.red),
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
