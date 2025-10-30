import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartOxygenation extends StatefulWidget {
  const LineChartOxygenation({super.key});

  @override
  State<LineChartOxygenation> createState() => _LineChartOxygenationState();
}

class _LineChartOxygenationState extends State<LineChartOxygenation> {
  @override
  Widget build(BuildContext context) {
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
            child: LineChart(dayData()),
          ),
        ),
      ],
    );
  }

  //para hora
  Widget bottomTitleHourWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    String text = switch (value.toInt()) {
      2 => '10 M',
      4 => '20 M',
      6 => '30 M',
      8 => '40 M',
      10 => '50 M',
      _ => '',
    };
    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: style),
    );
  }

  //para doce horas
  Widget bottomTitleTwelveHoursWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    String text = switch (value.toInt()) {
      2 => '2 H',
      4 => '4 H',
      6 => '6 H',
      8 => '8 H',
      10 => '10 H',
      _ => '',
    };
    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: style),
    );
  }

  //para dia
  Widget bottomTitleDayWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    String text = switch (value.toInt()) {
      2 => '4 H',
      4 => '8 H',
      6 => '12 H',
      8 => '16 H',
      10 => '20 H',
      _ => '',
    };
    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
    String text = switch (value.toInt()) {
      1 => '80',
      3 => '85',
      5 => '90',
      7 => '95',
      9 => '100',
      _ => '',
    };

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData hourData() {
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
            getTitlesWidget: bottomTitleHourWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
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
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
            FlSpot(12, 8),
          ],
          isCurved: true,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
        ),
      ],
    );
  }

  LineChartData twelveHoursData() {
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
            getTitlesWidget: bottomTitleTwelveHoursWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
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
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
            FlSpot(12, 8),
          ],
          isCurved: true,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
        ),
      ],
    );
  }

  LineChartData dayData() {
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
            getTitlesWidget: bottomTitleDayWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
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
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
            FlSpot(12, 8),
          ],
          isCurved: true,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
        ),
      ],
    );
  }
}
