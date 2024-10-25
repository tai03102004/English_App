// ignore: file_names
import 'package:app/Definitons/size_config.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TopPerformance extends StatelessWidget {
  const TopPerformance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 330,
        height: 400,
        decoration: BoxDecoration(
          color: const Color(0xFF6F60FB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 10),
            _buildLabels(),
            const SizedBox(height: 20),
            _buildBarChart(),
          ],
        ),
      ),
    );
  }

  // Hàm xây dựng tiêu đề và biểu tượng
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Top performance by',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'category',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/images/profiles/t_p.png",
            width: 40,
          ),
        ],
      ),
    );
  }

  // Hàm xây dựng phần nhãn cho các mục (Math, Sports, Music)
  Widget _buildLabels() {
    final labels = [
      {'color': Colors.pinkAccent, 'text': 'Math'},
      {'color': Colors.lightBlueAccent, 'text': 'Sports'},
      {'color': Colors.blueGrey, 'text': 'Music'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: labels
          .map((label) => Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: label['color'] as Color,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    label['text'] as String,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ))
          .toList(),
    );
  }

  // Hàm xây dựng biểu đồ cột
  Widget _buildBarChart() {
    return Expanded(
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 10,
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: _buildBottomTitles(),
            leftTitles: _buildLeftTitles(),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 2,
            checkToShowHorizontalLine: (value) {
              return value == 0 || value == 10 || value % 2 == 0;
            },
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.white.withOpacity(0.5),
                strokeWidth: 1,
                dashArray: [5, 5],
              );
            },
          ),
          borderData: FlBorderData(show: false),
          barGroups: _buildBarGroups(),
        ),
      ),
    );
  }

  // Hàm xây dựng phần nhãn dưới (bottomTitles)
  AxisTitles _buildBottomTitles() {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: (double value, TitleMeta meta) {
          final titles = ['3/10', '8/10', '6/10'];
          if (value.toInt() >= 0 && value.toInt() < titles.length) {
            return Text(titles[value.toInt()],
                style: style, textAlign: TextAlign.center);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  // Hàm xây dựng phần nhãn bên trái (leftTitles)
  AxisTitles _buildLeftTitles() {
    const style = TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );

    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: 2,
        getTitlesWidget: (double value, TitleMeta meta) {
          if (value == 0 || value == 10 || value % 2 == 0) {
            return Text('${value.toInt()}',
                style: style, textAlign: TextAlign.center);
          }
          return Container();
        },
      ),
    );
  }

  // Hàm xây dựng các nhóm cột (barGroups)
  List<BarChartGroupData> _buildBarGroups() {
    final bars = [
      {'y': 3.0, 'color': Colors.pinkAccent},
      {'y': 8.0, 'color': Colors.lightBlueAccent},
      {'y': 6.0, 'color': Colors.blueGrey},
    ];

    return bars
        .asMap()
        .entries
        .map((entry) => BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  toY: entry.value['y'] as double,
                  color: entry.value['color'] as Color,
                  width: 20,
                )
              ],
            ))
        .toList();
  }
}
