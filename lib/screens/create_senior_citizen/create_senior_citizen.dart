import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateSeniorCitizenScreen extends ConsumerStatefulWidget {
  const CreateSeniorCitizenScreen({super.key});

  @override
  ConsumerState<CreateSeniorCitizenScreen> createState() =>
      _CreateSeniorCitizenScreenState();
}

class _CreateSeniorCitizenScreenState extends ConsumerState<CreateSeniorCitizenScreen> {
  //controllers
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _birthdateController = TextEditingController();
  //error message
  String? _errorMessague;
  //loading
  bool _loading = false;
  //metodo que registra una persona mayor
  Future<void> _createSeniorCitizen() async {
    setState(() {
      _loading = true;
      _errorMessague = null;
    });
    try {} catch (e) {
      setState(() {
        _errorMessague = 'Error inesperado';
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
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nombres'),
                ),
                TextField(
                  controller: _lastnameController,
                  decoration: InputDecoration(labelText: 'Apellidos'),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Fecha de Diagnóstico',
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
