import 'package:flutter/material.dart';

class CarerPerfilCard extends StatelessWidget {
  const CarerPerfilCard({
    super.key,
    required this.names,
    required this.lastnames,
  });
  final String names;
  final String lastnames;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text('$names $lastnames'),
          trailing: FloatingActionButton.small(
            onPressed: () {},
            child: Icon(Icons.edit),
          ),
        ),
      ),
    );
  }
}
