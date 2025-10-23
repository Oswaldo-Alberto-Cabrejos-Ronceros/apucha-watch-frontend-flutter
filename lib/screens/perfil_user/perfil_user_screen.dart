import 'package:apucha_watch_movil/features/auth/presentation/provider/session_data_provider.dart';
import 'package:apucha_watch_movil/features/cared_profile/domain/models/cared_profile_response.dart';
import 'package:apucha_watch_movil/features/cared_profile/presentation/provider/cared_profile_service_provider.dart';
import 'package:apucha_watch_movil/features/cared_senior_citizen/presentation/provider/cared_senior_citizen_service_provider.dart';
import 'package:apucha_watch_movil/features/senior_citizen_profile/domain/models/senior_citizen_profile_response.dart';
import 'package:apucha_watch_movil/features/senior_citizen_profile/presentation/provider/senior_citizen_profile_service_provider.dart';
import 'package:apucha_watch_movil/screens/perfil_user/widgets/carer_perfil_card.dart';
import 'package:apucha_watch_movil/screens/perfil_user/widgets/confirm_out_session_alert_dialog.dart';
import 'package:apucha_watch_movil/screens/perfil_user/widgets/senior_citizen_perfil_card.dart';
import 'package:apucha_watch_movil/screens/perfil_user/widgets/update_cared_perfil_alert_dialog.dart';
import 'package:apucha_watch_movil/screens/perfil_user/widgets/update_senior_citizen_alert_dialog.dart';
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
  //for data senior citizen
  String? _errorMessagueSeniorCitizen;
  bool _loadingSeniorCitizen = false;
  SeniorCitizenProfileResponse? _seniorCitizenProfile;
  //on didChangeDependencies
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchCaredProfile();
    _fetchSeniorCitizenData();
  }

  //metodo busca perfil
  Future<void> _fetchCaredProfile() async {
    if (!mounted) return;
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
      if (!mounted) return;
      setState(() {
        _errorMessague = 'Error inesperado $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  //metodo para obtener datos del adulto mayor
  Future<void> _fetchSeniorCitizenData() async {
    if (!mounted) return;
    setState(() {
      _loadingSeniorCitizen = true;
      _errorMessagueSeniorCitizen = null;
    });
    try {
      final sessionData = ref.watch(sessionDataProvider);
      final String userId = sessionData?['userId'];
      if (userId == '') {
        throw Exception('UserId no encontrado en sessionDataProvider');
      }
      //obtenemos relaciones cuidador - adulto mayor
      final caredSeniorCitizenService = ref.read(
        caredSeniroCitizenServiceProvider,
      );
      final relations = await caredSeniorCitizenService.getAllByUserId(userId);
      if (relations.isEmpty) {
        throw Exception('No se encontraron relaciones para el userId: $userId');
      }
      //tomamos el primer adulto mayor
      final seniorCitizenId = relations.first.seniorCitizenProfile.id;
      //obtenemos los datos
      final seniorCitizenProfileService = ref.read(
        seniorCitizenProfileServiceProvide,
      );
      final seniorCitizenProfile = await seniorCitizenProfileService.findOne(
        seniorCitizenId,
      );

      if (seniorCitizenProfile == null) {
        throw Exception(
          'No se encontró perfil del adulto mayor con id: $seniorCitizenId',
        );
      }
      _seniorCitizenProfile = seniorCitizenProfile;
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessagueSeniorCitizen = 'Error inesperado $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  //para abrir Modal cared prodile
  Future<void> showModalEditCaredProfile(
    int caredPerfilId,
    String names,
    String lastnames,
  ) async {
    await showDialog(
      context: context,
      builder: (context) => UpdateCaredPerfilAlertDialog(
        caredProfileId: caredPerfilId,
        caredNames: names,
        caredLastnames: lastnames,
      ),
    );
    await _fetchCaredProfile();
  }

  //para abri modal edit senior citizen
  Future<void> showModalEditSeniorCitizen(
    int seniorProfileId,
    String names,
    String lastnames,
    DateTime birthdate,
  ) async {
    await showDialog(
      context: context,
      builder: (context) => UpdateSeniorCitizenAlertDialog(
        seniorCitizenProfileId: seniorProfileId,
        name: names,
        lastname: lastnames,
        birthdate: birthdate,
      ),
    );
    await _fetchSeniorCitizenData();
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
            : CarerPerfilCard(
                caredPerfilId: _caredProfile!.id,
                names: _caredProfile?.name ?? "",
                lastnames: _caredProfile?.lastname ?? "",
                onEditar: showModalEditCaredProfile,
              ),
        if (_errorMessague != null)
          Text(
            _errorMessague ?? 'No se encontró perfil',
            style: const TextStyle(color: Colors.red),
          ),
        Text(
          'Perfil del Adulto Mayor',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        _seniorCitizenProfile == null && _loadingSeniorCitizen
            ? const CircularProgressIndicator()
            : SeniorCitizenPerfilCard(
                seniorCitizenId: _seniorCitizenProfile!.id,
                names: _seniorCitizenProfile?.name ?? "",
                lastnames: _seniorCitizenProfile?.lastname ?? "",
                age: () {
                  if (_seniorCitizenProfile?.birthdate != null) {
                    final today = DateTime.now();
                    final birthDate = _seniorCitizenProfile!.birthdate;
                    int age = today.year - birthDate.year;
                    if (today.month < birthDate.month ||
                        (today.month == birthDate.month &&
                            today.day < birthDate.day)) {
                      age--;
                    }
                    return age;
                  }
                  return 0;
                }(),
                birthDate: _seniorCitizenProfile?.birthdate ?? DateTime.now(),
                onEditar: showModalEditSeniorCitizen,
              ),
        if (_errorMessagueSeniorCitizen != null)
          Text(
            _errorMessagueSeniorCitizen ??
                'No se encontró perfil de la persona mayor',
            style: const TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
