import 'package:apucha_watch_movil/features/health-condition/domain/models/health_condition_response.dart';
import 'package:apucha_watch_movil/features/health-condition/presentation/providers/health_condition_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddHealthConditionAlertDialog extends ConsumerStatefulWidget {
  const AddHealthConditionAlertDialog({
    super.key,
    required this.seniorCitizenId,
  });

  final int seniorCitizenId;
  @override
  ConsumerState<AddHealthConditionAlertDialog> createState() =>
      _AddHealthConditionAlertDialogState();
}

class _AddHealthConditionAlertDialogState
    extends ConsumerState<AddHealthConditionAlertDialog> {
  int condition = -1;
  String severity = '';
  DateTime? diagnosisDate;
  final List<String> severities = ['Leve', 'Moderada', 'Severa'];
  //error message
  String? _errorMessague;
  bool _loading = false;
  List<HealthConditionResponse> _conditions = [];
  //for date picket
  final TextEditingController _dateController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchHealthConditions();
  }

  //para obtener healthCondition
  Future<void> _fetchHealthConditions() async {
    if (!mounted) return;
    setState(() {
      _loading = true;
      _errorMessague = null;
    });
    try {
      final healthConditionService = ref.read(healthConditionServiceProvider);
      _conditions = await healthConditionService.findAll();
      if (_conditions.isEmpty) {
        throw Exception('No se encontraron condiciones de salud');
      }
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
    return AlertDialog(
      title: Text('Agregar Condición de Salud'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _loading
              ? const CircularProgressIndicator()
              : DropdownButtonFormField<int>(
                  decoration: const InputDecoration(labelText: 'Condición'),
                  items: _conditions
                      .map(
                        (cond) => DropdownMenuItem<int>(
                          value: cond.id,
                          child: Text(cond.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      condition = value ?? -1;
                    });
                  },
                ),
          if (_errorMessague != null)
            Text(
              _errorMessague ?? 'No se encontró perfil',
              style: const TextStyle(color: Colors.red),
            ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Fecha de Diagnóstico',
              suffixIcon: Icon(Icons.calendar_today),
            ),
            readOnly: true,
            controller: _dateController,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              setState(() {
                diagnosisDate = pickedDate;
                _dateController.text =
                    "${pickedDate?.day}/${pickedDate?.month}/${pickedDate?.year}";
              });
            },
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Severidad'),
            items: severities
                .map((sev) => DropdownMenuItem(value: sev, child: Text(sev)))
                .toList(),
            onChanged: (value) {
              setState(() {
                severity = value ?? '';
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (condition != -1 &&
                diagnosisDate != null &&
                severity.isNotEmpty) {
              Navigator.of(context).pop();
            } else {}
          },
          child: Text('Guardar'),
        ),
      ],
    );
  }
}
