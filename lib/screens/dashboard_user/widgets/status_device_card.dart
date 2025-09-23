import 'package:flutter/material.dart';

class StatusDeviceCard extends StatelessWidget {
  const StatusDeviceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                'Estado del dispositivo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.watch),
                title: Text('Estado'),
                trailing: Text('Conectado', style: TextStyle(color: Colors.green)),
              ),
              ListTile(
                leading: Icon(Icons.battery_full),
                title: Text('Batería'),
                trailing: Text('85%', style: TextStyle(color: Colors.orange)),
              ),
              ListTile(
                leading: Icon(Icons.signal_cellular_4_bar),
                title: Text('Señal'),
                trailing: Text('Buena', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}