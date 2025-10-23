import 'package:flutter/material.dart';

class CarerPerfilCard extends StatelessWidget {
  const CarerPerfilCard({
    super.key,
    required this.caredPerfilId,
    required this.names,
    required this.lastnames,
    required this.onEditar,
  });
  final int caredPerfilId;
  final String names;
  final String lastnames;
  final Function(int, String, String) onEditar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text('$names $lastnames'),
          trailing: FloatingActionButton.small(
            onPressed: () {
              onEditar(caredPerfilId, names, lastnames);
            },
            child: Icon(Icons.edit),
          ),
        ),
      ),
    );
  }
}
