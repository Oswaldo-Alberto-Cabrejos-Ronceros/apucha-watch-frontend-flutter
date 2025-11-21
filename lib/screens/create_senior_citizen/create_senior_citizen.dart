import 'package:apucha_watch_movil/features/auth/presentation/provider/session_data_provider.dart';
import 'package:apucha_watch_movil/features/cared_senior_citizen/domain/models/cared_senior_citizen_with_user_request.dart';
import 'package:apucha_watch_movil/features/cared_senior_citizen/presentation/provider/cared_senior_citizen_service_provider.dart';
import 'package:apucha_watch_movil/features/senior_citizen_profile/domain/models/senior_citizen_request.dart';
import 'package:apucha_watch_movil/features/senior_citizen_profile/presentation/provider/senior_citizen_profile_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CreateSeniorCitizenScreen extends ConsumerStatefulWidget {
  const CreateSeniorCitizenScreen({super.key});

  @override
  ConsumerState<CreateSeniorCitizenScreen> createState() =>
      _CreateSeniorCitizenScreenState();
}

class _CreateSeniorCitizenScreenState
    extends ConsumerState<CreateSeniorCitizenScreen> {
  //controllers
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdateController = TextEditingController();
  //error message
  String? _errorMessague;
  //loading
  bool _loading = false;
  //metodo que registra una persona mayor
  Future<void> _createSeniorCitizen() async {
    if (!mounted) return;
    setState(() {
      _loading = true;
      _errorMessague = null;
    });
    try {
      //get sessionData from provider
      final sessionData = ref.watch(sessionDataProvider);
      final int deviceId = sessionData?['deviceId'];
      final String userId = sessionData?['userId'];
      if (deviceId != 0 && userId != '') {
        final seniorCitizenService = ref.read(
          seniorCitizenProfileServiceProvide,
        );
        //parseamos
        //definimos el formato
        DateFormat inputFormat = DateFormat('dd/MM/yyyy');
        //parseamos la fecha
        DateTime parsedDate = inputFormat.parse(_birthdateController.text);
        //convertimos a ISO 8601 y quitamos hora
        String isoDate = parsedDate.toIso8601String().split('T')[0];

        //construimos un SeniorCitizenRequest
        final seniorCitizenRequest = SeniorCitizenRequest(
          name: _nameController.text,
          lastname: _lastnameController.text,
          birthdate: isoDate,
          phone: _phoneController.text,
          deviceId: deviceId,
        );
        //llamamos al servicio para
        final result = await seniorCitizenService.create(seniorCitizenRequest);
        if (result != null) {
          //llamamos al metodo para vincular caredPerfil con seniorCitizen
          final caredSeniorCitizenService = ref.read(
            caredSeniroCitizenServiceProvider,
          );
          //creamos request
          final caredSeniroCitizenWithUserRequest =
              CaredSeniorCitizenWithUserRequest(
                userId: userId,
                seniorCitizenProfileId: result.id,
              );
          final vinculoResult = await caredSeniorCitizenService.createWithUser(
            caredSeniroCitizenWithUserRequest,
          );
          if (vinculoResult != null) {
            //if exist
            if (!mounted) return;
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            if (!mounted) return;
            setState(() {
              _errorMessague = 'Error al vincular cuidador con adulto mayor';
            });
          }
        } else {
          if (!mounted) return;
          setState(() {
            _errorMessague = 'Error al registrar adulto mayor';
          });
        }
      } else {
        if (!mounted) return;
        setState(() {
          _errorMessague = 'Device Id o User Id no encontrado';
        });
      }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Crear Perfil del Adulto Mayor',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text('Ingrese los datos', style: TextStyle(fontSize: 16)),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nombres'),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Celular del reloj'),
                ),
                TextField(
                  controller: _lastnameController,
                  decoration: InputDecoration(labelText: 'Apellidos'),
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
                      _birthdateController.text =
                          "${pickedDate?.day}/${pickedDate?.month}/${pickedDate?.year}";
                    });
                  },
                ),
                if (_errorMessague != null)
                  Text(_errorMessague!, style: TextStyle(color: Colors.red)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _loading ? null : () => _createSeniorCitizen(),
                  child: _loading
                      ? CircularProgressIndicator()
                      : Text('Registrar Adulto Mayor'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
