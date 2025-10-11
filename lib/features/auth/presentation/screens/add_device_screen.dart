import 'package:flutter/material.dart';

class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({super.key});

  @override
  State<AddDeviceScreen> createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
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
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register/senior_citizen');
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
