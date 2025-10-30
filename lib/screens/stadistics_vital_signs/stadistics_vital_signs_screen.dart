import 'package:apucha_watch_movil/core/models/menu_item.dart';
import 'package:apucha_watch_movil/screens/stadistics_vital_signs/widgets/line_chart_heart_rate.dart';
import 'package:apucha_watch_movil/screens/stadistics_vital_signs/widgets/line_chart_oxygenation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StadisticsVitalSignsScreen extends ConsumerStatefulWidget {
  const StadisticsVitalSignsScreen({super.key});

  @override
  ConsumerState<StadisticsVitalSignsScreen> createState() =>
      _StadisticsVitalSignsScreenState();
}

class _StadisticsVitalSignsScreenState
    extends ConsumerState<StadisticsVitalSignsScreen> {
  String resolution = 'TREINTA_SEG';
  final List<MenuItem> resolutions = [
    MenuItem(value: 'TREINTA_SEG', label: '1 Hora'),
    MenuItem(value: 'UN_MIN', label: '12 Horas'),
    MenuItem(value: 'CINCO_MIN', label: '24 Horas'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Metricas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 240,
              child: DropdownButtonFormField<String>(
                initialValue: 'TREINTA_SEG',
                decoration: InputDecoration(labelText: 'Exactitud'),
                items: resolutions
                    .map(
                      (item) => DropdownMenuItem(
                        value: item.value,
                        child: Text(item.label),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    resolution = value ?? '';
                  });
                },
              ),
            ),
          ],
        ),
        Text('Ritmo cardiaco'),
        LineChartHeartRate(resolution: resolution),
        Text('Oxigenación'),
        LineChartOxygenation()
      ],
    );
  }
}
