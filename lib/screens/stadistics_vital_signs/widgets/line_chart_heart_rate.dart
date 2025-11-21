import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:apucha_watch_movil/features/vital_signs_sumary/domain/vital_signs_stats.dart';

class LineChartHeartRate extends StatelessWidget {
  final List<VitalSignPoint> dataPoints;

  const LineChartHeartRate({
    super.key,
    required this.dataPoints,
  });

  // --- Si no hay datos, devolvemos valores dummy como ejemplo ---
  List<FlSpot> _getSpots() {
    if (dataPoints.isEmpty) {
      return const [
        FlSpot(0, 70),
        FlSpot(2, 72),
        FlSpot(4, 68),
        FlSpot(6, 75),
        FlSpot(8, 73),
        FlSpot(10, 78),
        FlSpot(12, 74),
      ];
    }

    final sortedPoints = [...dataPoints]..sort((a, b) => a.x.compareTo(b.x));

    return sortedPoints
        .map(
          (point) => FlSpot(point.x, point.y*10),
        )
        .toList();
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
    return SideTitleWidget(
      meta: meta,
      child: Text(value.toInt().toString(), style: style),
    );
  }

  Widget _leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
    return Text(
      value.toInt().toString(),
      style: style,
      textAlign: TextAlign.left,
    );
  }

  LineChartData _getChartData(List<FlSpot> spots) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 5,
        verticalInterval: 2,
        getDrawingHorizontalLine: (value) {
          return const FlLine(color: Colors.grey, strokeWidth: 0.5);
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(color: Colors.grey, strokeWidth: 0.5);
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
            interval: 2,
            reservedSize: 30,
            getTitlesWidget: _bottomTitleWidgets,
          ),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 5,
            reservedSize: 42,
            getTitlesWidget: _leftTitleWidgets,
          ),
        ),
      ),

      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),

      minX: 0,
      maxX: 12,
      minY: 40,
      maxY: 120,

      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          barWidth: 4,
          isStrokeCapRound: true,
          color: Colors.red,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.redAccent.withOpacity(0.3),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final spots = _getSpots();

    return AspectRatio(
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
    );
  }
}