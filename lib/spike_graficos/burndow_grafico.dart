import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// Credit: https://dribbble.com/shots/10072126-Heeded-Dashboard
class BurndownGrafico extends StatelessWidget {
  const BurndownGrafico({Key? key}) : super(key: key);

  static const pilateColor = Color(0xff632af2);
  static const cyclingColor = Color(0xffffb3ba);
  static const quickWorkoutColor = Color(0xff578eff);
  static const betweenSpace = 0.1;

  BarChartGroupData generateGroupData(
      int x, double pilates, double quickWorkout, double cycling) {
    return BarChartGroupData(
      x: x - 1,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          colors: [pilateColor],
          width: 15,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout,
          colors: [quickWorkoutColor],
          width: 15,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace + quickWorkout + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout + betweenSpace + cycling,
          colors: [cyclingColor],
          width: 15,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burndow"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                    ),
                    child: const Text(
                      'Velocidade',
                      style: TextStyle(
                        color: Color(0xff171547),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: 500,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20
                          ),
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceAround,
                              titlesData: FlTitlesData(
                                leftTitles: SideTitles(showTitles: true),
                                rightTitles: SideTitles(showTitles: false),
                                topTitles: SideTitles(showTitles: false),
                                bottomTitles: SideTitles(
                                  showTitles: true,
                                  getTextStyles: (context, value) => const TextStyle(
                                    color: Color(0xff787694),
                                    fontSize: 12,
                                  ),
                                  getTitles: (value) {
                                    return "Sprint ${value.toInt() + 1}";
                                  },
                                ),
                              ),
                              barTouchData: BarTouchData(
                                enabled: true,
                                touchTooltipData: BarTouchTooltipData(
                                  tooltipBgColor: Colors.blueGrey,
                                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                                    final sprint = "Sprint ${group.x + 1}";
                                    return BarTooltipItem(
                                      sprint + '\n',
                                      const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: rod.toY.toStringAsFixed(1),
                                          style: const TextStyle(
                                            color: Colors.yellow,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              borderData: FlBorderData(show: false),
                              gridData: FlGridData(show: false),
                              barGroups: [
                                //generateGroupData(0, 0, 0, 0),
                                generateGroupData(1, 2, 3, 2),
                                generateGroupData(2, 2, 5, 1.7),
                                generateGroupData(3, 1.3, 3.1, 2.8),
                                generateGroupData(4, 3.1, 4, 3.1),
                                generateGroupData(5, 0.8, 3.3, 3.4),
                                generateGroupData(6, 2, 5.6, 1.8),
                                generateGroupData(7, 1.3, 3.2, 2),
                                generateGroupData(8, 2.3, 3.2, 3),
                                generateGroupData(9, 2, 4.8, 2.5),
                                generateGroupData(10, 1.2, 3.2, 2.5),
                                generateGroupData(11, 1, 4.8, 3),
                                generateGroupData(12, 2, 4.4, 2.8),
                              ],
                              maxY: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

  //                   static const pilateColor = Color(0xff632af2);
  // static const cyclingColor = Color(0xffffb3ba);
  // static const quickWorkoutColor = Color(0xff578eff);

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              color: pilateColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Leganda 1"),
                          ],
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              color: cyclingColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Leganda 2"),
                          ],
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              color: quickWorkoutColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Leganda 3"),
                          ],
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Leganda 4"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}