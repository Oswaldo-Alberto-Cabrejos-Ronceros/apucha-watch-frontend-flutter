import 'package:apucha_watch_movil/core/socket_io_client/socket_io_client.dart';
import 'package:apucha_watch_movil/features/auth/presentation/provider/session_data_provider.dart';
import 'package:apucha_watch_movil/features/cared_profile/domain/models/assing_token_device_request.dart';
import 'package:apucha_watch_movil/features/cared_profile/domain/models/cared_profile_response.dart';
import 'package:apucha_watch_movil/features/cared_profile/presentation/provider/cared_profile_service_provider.dart';
import 'package:apucha_watch_movil/features/cared_senior_citizen/presentation/provider/cared_senior_citizen_service_provider.dart';
import 'package:apucha_watch_movil/features/senior_citizen_profile/domain/models/senior_citizen_profile_response.dart';
import 'package:apucha_watch_movil/features/senior_citizen_profile/presentation/provider/senior_citizen_profile_service_provider.dart';
import 'package:apucha_watch_movil/features/vitalsign/domain/models/vital_sign_minimun_response.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/widgets/location_card.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/widgets/senior_citizen_principal_card.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/widgets/status_device_card.dart';
import 'package:apucha_watch_movil/screens/dashboard_user/widgets/vital_signs_card.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  //for data senior citizen
  String? _errorMessagueSeniorCitizen;
  bool _loadingSeniorCitizen = false;
  SeniorCitizenProfileResponse? _seniorCitizenProfile;
  //for vital-signs data
  String? _errorMessagueVitalSigns;
  bool _loadingVitalSigns = false;
  VitalSignMinimunResponse vitalsSigns = VitalSignMinimunResponse(
    heartRate: 0,
    oxygenSaturation: 0,
  );
  //for now
  List<String> healthConditions = ['Hipertensión', 'Diabetes'];
  //on didChangeDependencies
  final sockedIoClient = SocketIOClient();
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await _fetchCaredProfile();
    await _fetchSeniorCitizenData();
    await _fetchVitalSigns();
    await _assingDeviceToken();
  }

  @override
  void dispose() {
    sockedIoClient.disconnect();
    sockedIoClient.dispose();
    super.dispose();
  }

  //metodo para pedir permisos para enviar
  Future<void> _assingDeviceToken() async {
    try {
      if (_caredProfile == null) {
        throw Exception('Cared profile no encontrado');
      }

      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? token = await messaging.getToken();
      if (_caredProfile?.deviceToken == token) {
        return;
      }
      //solicitamos permisos
      await messaging.requestPermission();

      if (token != null) {
        final caredProfileService = ref.read(caredProfileServiceProvider);
        AssingTokenDeviceRequest request = AssingTokenDeviceRequest(
          userId: _caredProfile!.userId,
          deviceToken: token,
        );
        await caredProfileService.assignTokenDevice(request);
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error al asignar deviceToken $e');
    }
  }

  //metodo para recibir signos vitales
  Future<void> _fetchVitalSigns() async {
    if (!mounted) return;
    setState(() {
      _loadingVitalSigns = true;
      _errorMessagueVitalSigns = null;
    });

    try {
      final sessionData = ref.watch(sessionDataProvider);
      final String token = sessionData?['token'];
      if (token == '') {
        throw Exception('Token no encontrado en sessionDataProvider');
      }
      sockedIoClient.connect(
        'https://apucha-watch-backend-1094750444303.us-west1.run.app',
        token: token,
      );

      if (_seniorCitizenProfile == null) {
        throw Exception('Perfil de adulto mayor no encontrado');
      }
      sockedIoClient.emit('subscribe', {
        "deviceCode": _seniorCitizenProfile?.device.code,
      });
      sockedIoClient.on('vital-signs-update', (callback) {
        VitalSignMinimunResponse vitalSignResponse =
            VitalSignMinimunResponse.fromJson(callback);
        setState(() {
          vitalsSigns = vitalSignResponse;
        });
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessagueVitalSigns = 'Error inesperado $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _loadingVitalSigns = false;
        });
      }
    }
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
      final sessionDataNotifier = ref.watch(sessionDataProvider.notifier);
      sessionDataNotifier.setSeniorCitizenProfileId(seniorCitizenId);
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
        _seniorCitizenProfile == null && _loadingSeniorCitizen
            ? const CircularProgressIndicator()
            : SeniorCitizenPrincipalCard(
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
                healthConditions: healthConditions,
              ),
        if (_errorMessagueSeniorCitizen != null)
          Text(
            _errorMessagueSeniorCitizen ??
                'No se encontró perfil de la persona mayor',
            style: const TextStyle(color: Colors.red),
          ),
        _loadingVitalSigns
            ? const CircularProgressIndicator()
            : VitalSignsCard(vitalSigns: vitalsSigns),
        if (_errorMessagueVitalSigns != null)
          Text(
            _errorMessagueVitalSigns ?? 'Error al cargar signos vitales',
            style: const TextStyle(color: Colors.red),
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
