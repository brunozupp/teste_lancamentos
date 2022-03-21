import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Burndown3Grafico extends StatefulWidget {
  const Burndown3Grafico({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Burndown3GraficoState();
}

class Burndown3GraficoState extends State<Burndown3Grafico> {
  final Color leftBarColor = Colors.blue;
  final Color rightBarColor = Colors.green;
  final double width = 10;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 0, 12);
    final barGroup2 = makeGroupData(1, 0, 12);
    final barGroup3 = makeGroupData(2, 0, 5);
    final barGroup4 = makeGroupData(3, 0, 16);
    final barGroup5 = makeGroupData(4, 0, 6);
    final barGroup6 = makeGroupData(5, 0, 1.5);
    final barGroup7 = makeGroupData(6, 0, 17.5);
    final barGroup8 = makeGroupData(7, 0, 18.5);
    final barGroup9 = makeGroupData(8, 0, 19.5);
    final barGroup10 = makeGroupData(9, 0, 13.5);
    final barGroup11 = makeGroupData(10, 10, 12.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
      barGroup8,
      barGroup9,
      barGroup10,
      barGroup11,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Burndown Linha duplas",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              color: const Color(0xff2c4260),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 50,
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        makeTransactionsIcon(),
                        const SizedBox(
                          width: 38,
                        ),
                        const Text(
                          'Transactions',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          'state',
                          style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        maxHeight: 300,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: AspectRatio(
                          aspectRatio: 1.8,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 40.0,
                            ),
                            child: BarChart(
                              BarChartData(
                                maxY: 20,
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
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: SideTitles(showTitles: false),
                                  topTitles: SideTitles(showTitles: false),
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (context, value) => const TextStyle(
                                      color: Color(0xff7589a2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                    ),
                                    margin: 10,
                                    rotateAngle: 60,
                                    getTitles: (double value) {
                                      return "Sprint ${value.toInt() + 1}";
                                    },
                                  ),
                                  leftTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (context, value) => const TextStyle(
                                      color: Color(0xff7589a2),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                    ),
                                    margin: 8,
                                    getTitles: (value) {
                                      if (value == 0) {
                                        return '0';
                                      } else if (value == 5) {
                                        return '5';
                                      } else if (value == 10) {
                                        return '10';
                                      } else if (value == 15) {
                                        return '15';
                                      } else if (value == 20) {
                                        return '20';
                                      } else {
                                        return '';
                                      }
                                    },
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                barGroups: showingBarGroups,
                                gridData: FlGridData(
                                  show: true,
                                  drawVerticalLine: false,
                                  drawHorizontalLine: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {

    final naoConcluido = BarChartRodData(
      toY: y1,
      colors: [leftBarColor],
      width: width,
    );

    final concluido = BarChartRodData(
      toY: y2,
      colors: [rightBarColor],
      width: width,
    );

    final barRods = y1 == 0
        ? [concluido, naoConcluido] : [naoConcluido, concluido];

    return BarChartGroupData(barsSpace: 5, x: x, barRods: barRods);
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}