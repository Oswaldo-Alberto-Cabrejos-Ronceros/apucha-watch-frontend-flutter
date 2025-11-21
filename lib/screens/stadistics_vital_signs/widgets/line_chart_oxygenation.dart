import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:apucha_watch_movil/features/vital_signs_sumary/domain/vital_signs_stats.dart';



class LineChartOxygenation extends StatelessWidget {

  final List<VitalSignPoint> dataPoints;

  const LineChartOxygenation({
    super.key, 
    required this.dataPoints,
  });


  static const double chartMinY = 85.0;   
  static const double chartMaxY = 100.0;  
  static const double chartMaxX = 24.0;   


  List<FlSpot> _getSpots() {

    if (dataPoints.isEmpty) {
   
      return const [
        FlSpot(0, 96.5),
        FlSpot(3, 95.8),
        FlSpot(6, 97.1),
        FlSpot(9, 98.3),
        FlSpot(12, 96.9),
        FlSpot(15, 94.2),
        FlSpot(18, 95.5),
        FlSpot(21, 97.9),
        FlSpot(24, 96.1),
      ];
    }
    final sortedPoints = [...dataPoints]..sort((a, b) => a.x.compareTo(b.x));
    return sortedPoints.map((point) {
      return FlSpot(point.x, point.y);
    }).toList();
  }
  

  


  LineChartData _getChartData(List<FlSpot> spots) {
    
 
    
    
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(color: Colors.blueAccent, strokeWidth: 1);
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(color: Colors.blueAccent, strokeWidth: 1);
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 9,
      lineBarsData: [
        LineChartBarData(
          spots: spots.map((point) {
      return FlSpot(point.x, point.y);
    }).toList(),
          isCurved: true,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
  
    final spots = _getSpots();
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(_getChartData(spots)),
          ),
        ),
      ],
    );
  }
}