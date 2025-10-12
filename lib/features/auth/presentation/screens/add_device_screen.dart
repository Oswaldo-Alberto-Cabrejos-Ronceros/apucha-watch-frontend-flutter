import 'package:apucha_watch_movil/features/auth/presentation/provider/session_data_provider.dart';
import 'package:apucha_watch_movil/features/device/domain/models/device_request.dart';
import 'package:apucha_watch_movil/features/device/presentation/provider/device_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddDeviceScreen extends ConsumerStatefulWidget {
  const AddDeviceScreen({super.key});

  @override
  ConsumerState<AddDeviceScreen> createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends ConsumerState<AddDeviceScreen> {
  //controllers
  final _codeController = TextEditingController();
  //error message
  String? _errorMessague;
  //loading
  bool _loading = false;
  //metodo para registrar dispositivo
  Future<void> _addDevice() async {
    setState(() {
      _loading = true;
      _errorMessague = null;
    });
    try {
      //creamos un deviceService
      final deviceService = ref.read(deviceServiceProvider);
      //contruimos un deviceRequest
      final deviceRequest = DeviceRequest(code: _codeController.text);
      final result = await deviceService.create(deviceRequest);
      if (result != null) {
        //if exist
        if (!mounted) return;
        final sessionDataProviderRef = ref.read(sessionDataProvider.notifier);
        sessionDataProviderRef.setDeviceId(result.id);
        Navigator.pushNamed(context, '/register/senior_citizen');
      } else {
        setState(() {
          _errorMessague = 'Error al vincular dispositivo';
        });
      }
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
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: [
                Text(
                  'Vincular reloj',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  'Ingrese el codigo del reloj',
                  style: TextStyle(fontSize: 16),
                ),
                //textfield email
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Codigo del reloj',
                    border: OutlineInputBorder(),
                  ),
                  controller: _codeController,
                ),
                if (_loading) CircularProgressIndicator(),
                if (_errorMessague != null)
                  Text(_errorMessague!, style: TextStyle(color: Colors.red)),
                FilledButton(
                  onPressed: () {
                    _addDevice();
                  },
                  child: Text('Vincular'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
