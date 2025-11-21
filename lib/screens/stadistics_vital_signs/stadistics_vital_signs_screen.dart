// ignore_for_file: unused_field

import 'package:apucha_watch_movil/features/auth/presentation/provider/session_data_provider.dart';
import 'package:apucha_watch_movil/features/cared_profile/domain/models/cared_profile_response.dart';
import 'package:apucha_watch_movil/features/cared_profile/presentation/provider/cared_profile_service_provider.dart';
import 'package:apucha_watch_movil/features/cared_senior_citizen/presentation/provider/cared_senior_citizen_service_provider.dart';
import 'package:apucha_watch_movil/features/senior_citizen_profile/domain/models/senior_citizen_profile_response.dart';
import 'package:apucha_watch_movil/features/senior_citizen_profile/presentation/provider/senior_citizen_profile_service_provider.dart';
import 'package:apucha_watch_movil/features/vital_signs_sumary/domain/vital_signs_stats.dart';
import 'package:apucha_watch_movil/core/providers/api_client_provider.dart';
import 'package:apucha_watch_movil/features/vital_signs_sumary/infrastructure/vital_signs_stats_service.dart';
import 'package:apucha_watch_movil/screens/stadistics_vital_signs/widgets/line_chart_heart_rate.dart';
import 'package:apucha_watch_movil/screens/stadistics_vital_signs/widgets/line_chart_oxygenation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider del servicio de vital signs
final vitalSignsStatsServiceProvider = Provider<VitalSignsStatsService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return VitalSignsStatsService(apiClient);
});

class StadisticsVitalSignsScreen extends ConsumerStatefulWidget {
  const StadisticsVitalSignsScreen({super.key});

  @override
  ConsumerState<StadisticsVitalSignsScreen> createState() =>
      _StadisticsVitalSignsScreenState();
}

class _StadisticsVitalSignsScreenState
    extends ConsumerState<StadisticsVitalSignsScreen> {
  VitalSignsStats? _stats;
  bool _isLoading = false;
  String? _errorMessage;

  // DatePicker — fecha seleccionada
  DateTime _selectedDate = DateTime.now();

  // Datos de usuario
  CaredProfileResponse? _caredProfile;
  String? _errorMessagueSeniorCitizen;
  bool _loadingSeniorCitizen = false;
  SeniorCitizenProfileResponse? _seniorCitizenProfile;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await _fetchCaredProfile();
    await _fetchSeniorCitizenData();
    await _fetchVitalSignsStats();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });

      await _fetchVitalSignsStats();
    }
  }

  // -------------------------------
  //  Obtener estadísticas vitales
  // -------------------------------
  Future<void> _fetchVitalSignsStats() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final vitalSignsService = ref.read(vitalSignsStatsServiceProvider);

      final stats = await vitalSignsService.findAllByDayForStats(
        _seniorCitizenProfile?.device.code ?? "",
        _selectedDate,
      );

      if (mounted) {
        setState(() {
          _stats = stats;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Error al cargar estadísticas: $e';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // -------------------------------
  // Obtener perfil de cuidador
  // -------------------------------
  Future<void> _fetchCaredProfile() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final sessionData = ref.watch(sessionDataProvider);
      final String userId = sessionData?['userId'];
      if (userId == '') throw Exception('UserId no encontrado');

      final caredProfileService = ref.read(caredProfileServiceProvider);
      final caredProfile = await caredProfileService.findByUserId(userId);

      if (caredProfile == null) {
        throw Exception('No se encontró perfil cuidado para userId: $userId');
      }

      _caredProfile = caredProfile;
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Error inesperado $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // -------------------------------
  // Obtener datos del adulto mayor
  // -------------------------------
  Future<void> _fetchSeniorCitizenData() async {
    if (!mounted) return;
    setState(() {
      _loadingSeniorCitizen = true;
      _errorMessagueSeniorCitizen = null;
    });
    try {
      final sessionData = ref.watch(sessionDataProvider);
      final String userId = sessionData?['userId'];
      if (userId == '') throw Exception('UserId no encontrado');

      final caredSeniorCitizenService = ref.read(
        caredSeniroCitizenServiceProvider,
      );
      final relations = await caredSeniorCitizenService.getAllByUserId(userId);

      if (relations.isEmpty) {
        throw Exception('No se encontraron relaciones para userId: $userId');
      }

      final seniorCitizenId = relations.first.seniorCitizenProfile.id;

      final seniorCitizenProfileService = ref.read(
        seniorCitizenProfileServiceProvide,
      );

      final sessionDataNotifier = ref.watch(sessionDataProvider.notifier);
      sessionDataNotifier.setSeniorCitizenProfileId(seniorCitizenId);

      final seniorCitizenProfile = await seniorCitizenProfileService.findOne(
        seniorCitizenId,
      );

      if (seniorCitizenProfile == null) {
        throw Exception('No se encontró perfil del adulto mayor');
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
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Métricas de Signos Vitales',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 16),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fecha seleccionada: ${_selectedDate.toLocal().toString().split(' ')[0]}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            ElevatedButton(onPressed: _pickDate, child: Text("Cambiar Fecha")),
          ],
        ),

        SizedBox(height: 16),

        if (_isLoading)
          const Center(child: CircularProgressIndicator())
        else if (_errorMessage != null)
          Center(
            child: Text(_errorMessage!, style: TextStyle(color: Colors.red)),
          )
        else if (_stats == null)
          const Center(child: Text('No se encontraron datos para esa fecha.'))
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ritmo Cardíaco (Pulsos)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              LineChartHeartRate(dataPoints: _stats!.heartRate),

              SizedBox(height: 24),

              Text(
                'Oxigenación (SpO2 %)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              LineChartOxygenation(dataPoints: _stats!.oxygenation),
            ],
          ),
      ],
    );
  }
}
