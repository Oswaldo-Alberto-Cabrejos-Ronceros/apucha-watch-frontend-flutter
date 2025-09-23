import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({
    super.key,
    required this.value,
    required this.label,
    required this.title,
    this.color = Colors.blueGrey,
  });
  final String value;
  final String label;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(label, style: TextStyle(fontSize: 20)),
            Text(title, style: TextStyle(fontSize: 14, color: color)),
          ],
        ),
      ),
    )); 
  }
}
