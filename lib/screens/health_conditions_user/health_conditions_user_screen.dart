import 'package:apucha_watch_movil/features/auth/presentation/provider/session_data_provider.dart';
import 'package:apucha_watch_movil/features/senior_citizen_health_condition/domain/senior_citizen_health_condition_with_health_condition_response.dart';
import 'package:apucha_watch_movil/features/senior_citizen_health_condition/presentation/providers/senior_citizen_health_condition_provider.dart';
import 'package:apucha_watch_movil/screens/health_conditions_user/widgets/add_health_condition_alert_dialog.dart';
import 'package:apucha_watch_movil/screens/health_conditions_user/widgets/health_condition_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HealthConditionsUserScreen extends ConsumerStatefulWidget {
  const HealthConditionsUserScreen({super.key});

  @override
  ConsumerState<HealthConditionsUserScreen> createState() =>
      _HealthConditionsUserScreenState();
}

class _HealthConditionsUserScreenState
    extends ConsumerState<HealthConditionsUserScreen> {
  //seniorCitizenProfileId
  int? _seniorCitizenProfileId;
  //error message
  String? _errorMessague;
  bool _loading = false;
  List<SeniorCitizenHealthConditionWithHealthConditionResponse> _conditions =
      [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final sessionData = ref.watch(sessionDataProvider);
    final seniorCitizenProfileId = sessionData?['seniorCitizenProfileId'];
    _seniorCitizenProfileId = seniorCitizenProfileId;
    _fetchHealthConditionsWithSeniorCitizen();
  }

  //para obtener condiciones
  Future<void> _fetchHealthConditionsWithSeniorCitizen() async {
    if (!mounted) return;
    setState(() {
      _loading = true;
      _errorMessague = null;
    });
    try {
      if (_seniorCitizenProfileId == null) {
        throw Exception('No se encontro id del adulto mayor');
      }
      final seniorHealthConditionService = ref.read(
        seniorCitizenHealthConditionProvider,
      );
      _conditions = await seniorHealthConditionService.findAllBySeniorCitizenId(
        _seniorCitizenProfileId!,
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessague = 'Error al cargar condiciones de salud $e';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Condiciones de Salud',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            FloatingActionButton.small(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddHealthConditionAlertDialog(
                    seniorCitizenId: _seniorCitizenProfileId!,
                  ),
                );
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
        Column(
          children: [
            if (_loading)
              const CircularProgressIndicator()
            else
              ..._conditions.map(
                (e) => HealthConditionCard(
                  condition: e.healthCondition.name,
                  diagnosisDate: e.diagnosisDate.toString().split(' ')[0],
                  severity: e.severity,
                ),
              ),
          ],
        ),
        if (_errorMessague != null)
          Text(
            _errorMessague ?? 'Error al obtener condiciones de salud',
            style: const TextStyle(color: Colors.red),
          ),
        if (_conditions.isEmpty && !_loading)
          Text('No ha registrado condiciones de salud'),
      ],
    );
  }
}
