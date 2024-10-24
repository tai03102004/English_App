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
        width: 330, // Độ rộng của khung
        height: 400, // Chiều cao của khung
        decoration: BoxDecoration(
          color: Color(0xFF6F60FB), // Màu nền tím
          borderRadius: BorderRadius.circular(20), // Bo góc
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần tiêu đề và biểu tượng
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top performance by category',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Icon(Icons.bar_chart, color: Colors.white),
              ],
            ),
            const SizedBox(height: 10),

            // Phần labels của các mục (Math, Sports, Music)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.pinkAccent,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Math',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Sports',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.blueGrey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Music',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Biểu đồ cột
            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 10,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          );
                          switch (value.toInt()) {
                            case 0:
                              return Text('3/10\nQuestions\nAnswered',
                                  style: style, textAlign: TextAlign.center);
                            case 1:
                              return Text('8/10\nQuestions\nAnswered',
                                  style: style, textAlign: TextAlign.center);
                            case 2:
                              return Text('6/10\nQuestions\nAnswered',
                                  style: style, textAlign: TextAlign.center);
                            default:
                              return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                          toY: 3, color: Colors.pinkAccent, width: 20)
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                          toY: 8, color: Colors.lightBlueAccent, width: 20)
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(toY: 6, color: Colors.blueGrey, width: 20)
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
