import 'package:apucha_watch_movil/features/senior_citizen_profile/domain/models/senior_citizen_update_request.dart';
import 'package:apucha_watch_movil/features/senior_citizen_profile/presentation/provider/senior_citizen_profile_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateSeniorCitizenAlertDialog extends ConsumerStatefulWidget {
  const UpdateSeniorCitizenAlertDialog({
    super.key,
    required this.seniorCitizenProfileId,
    required this.name,
    required this.lastname,
    required this.birthdate,
  });
  final int seniorCitizenProfileId;
  final String name;
  final String lastname;
  final DateTime birthdate;

  @override
  ConsumerState<UpdateSeniorCitizenAlertDialog> createState() =>
      _UpdateSeniorCitizenAlertDialogState();
}

class _UpdateSeniorCitizenAlertDialogState
    extends ConsumerState<UpdateSeniorCitizenAlertDialog> {
  //controllers
  final _seniorNamesController = TextEditingController();
  final _seniorLastnamesController = TextEditingController();
  final _birthdateController = TextEditingController();
  DateTime? birthdate;
  //para envio
  bool _loading = false;
  String? _errorMessague;

  @override
  void initState() {
    super.initState();
    _seniorLastnamesController.text = widget.lastname;
    _seniorNamesController.text = widget.name;
    _birthdateController.text = widget.birthdate.toString();
  }

  Future<void> _sendEditSeniorCitizen() async {
    if (!mounted) return;
    setState(() {
      _loading = true;
      _errorMessague = null;
    });
    try {
      final seniorCitizenProfileService = ref.read(
        seniorCitizenProfileServiceProvide,
      );
      //creamos update request
      final updateRequest = SeniorCitizenUpdateRequest(
        name: _seniorNamesController.text,
        lastname: _seniorLastnamesController.text,
        birthdate: birthdate.toString(),
      );
      final updated = await seniorCitizenProfileService.update(
        widget.seniorCitizenProfileId,
        updateRequest,
      );
      if (updated == null) {
        throw Exception(
          'Error al actualizar perfil de adulto mayor, retorno null',
        );
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessague = 'Error al editar perfil $e';
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
      title: Text('Editar datos de adulto mayor'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Text('Nombres', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            decoration: InputDecoration(
              labelText: 'Nombres',
              border: OutlineInputBorder(),
            ),
            controller: _seniorNamesController,
          ),
          Text('Apellidos', style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            decoration: InputDecoration(
              labelText: 'Apellidos',
              border: OutlineInputBorder(),
            ),
            controller: _seniorLastnamesController,
          ),
          Text(
            'Fecha de nacimiento',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Fecha de Nacimiento',
              suffixIcon: Icon(Icons.calendar_today),
            ),
            readOnly: true,
            controller: _birthdateController,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              setState(() {
                birthdate = pickedDate;
                _birthdateController.text =
                    "${pickedDate?.day}/${pickedDate?.month}/${pickedDate?.year}";
              });
            },
          ),
          if (_loading) const CircularProgressIndicator(),
          //error
          if (_errorMessague != null)
            Text(
              _errorMessague ?? '',
              style: const TextStyle(color: Colors.red),
            ),
          ElevatedButton(
            onPressed: () async {
              await _sendEditSeniorCitizen();
              if (!mounted) return;
              if (!_loading && _errorMessague == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Guardado correctamente')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error correctamente $_errorMessague'),
                  ),
                );
              }
              Navigator.of(context).pop();
            },
            child: Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
