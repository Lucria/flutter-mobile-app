import 'dart:async';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/posts/posts_list_widget.dart';
import 'package:flutter_mobile_app/util/database.dart';
import 'package:flutter_mobile_app/util/util_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  late Timer timer;
  late Future<String> temperatureValue;
  late Future<String> oxygenValue;
  late Future<String> bpmValue;
  var dataPoints = <FlSpot>[const FlSpot(0, 0)];
  List<Color> gradientColors = [
    const Color(0xff22b2e1),
    const Color(0xff02d39a),
  ];

  @override
  void initState() {
    super.initState();
    temperatureValue =
        _databaseHelper.queryFirstValue(DatabaseHelper.temperatureTable);
    oxygenValue = _databaseHelper.queryFirstValue(DatabaseHelper.oxygenTable);
    bpmValue = _databaseHelper.queryFirstValue(DatabaseHelper.bpmTable);

    _databaseHelper.queryAllSensorData().then((sensorData) {
      if (sensorData.isNotEmpty) {
        dataPoints = sensorData
            .map(
                (data) => FlSpot(data.time!.toDouble(), data.value!.toDouble()))
            .toList();
      }
    });

    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      temperatureValue =
          _databaseHelper.queryFirstValue(DatabaseHelper.temperatureTable);
      oxygenValue = _databaseHelper.queryFirstValue(DatabaseHelper.oxygenTable);
      bpmValue = _databaseHelper.queryFirstValue(DatabaseHelper.bpmTable);
      _databaseHelper.queryAllSensorData().then((sensorData) {
        if (sensorData.isNotEmpty) {
          dataPoints = sensorData
              .map((data) =>
                  FlSpot(data.time!.toDouble(), data.value!.toDouble()))
              .toList();
        }
      });
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<String> _returnDisplayValue(String table) {
    if (table == DatabaseHelper.temperatureTable) {
      return temperatureValue;
    }
    if (table == DatabaseHelper.oxygenTable) {
      return oxygenValue;
    }
    return bpmValue;
  }

  Widget buildFutureStatDisplay(String table) {
    return FutureBuilder(
        future: _returnDisplayValue(table),
        initialData: "Loading...",
        builder: (BuildContext context, AsyncSnapshot<String> object) {
          return Text(
            object.data!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          );
        });
  }

  Widget buildChart() {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        color: Color(0xff99a0a7),
      ),
      child: SizedBox(
        width: 300,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 18,
            left: 0,
            top: 24,
            bottom: 12,
          ),
          child: LineChart(
            _bpmHistory(),
          ),
        ),
      ),
    );
  }

  LineChartData _bpmHistory() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: dataPoints.first.x,
      maxX: dataPoints.last.x,
      minY: dataPoints.map((value) => value.y).reduce(min),
      maxY: dataPoints.map((value) => value.y).reduce(max),
      lineBarsData: [
        LineChartBarData(
          spots: dataPoints,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double timestamp, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    String text;
    int day = DateTime
        .fromMillisecondsSinceEpoch(timestamp.toInt())
        .weekday;

    switch (day) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tues';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thurs';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        text,
        style: style
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.vertical, children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 120,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    roundedStatDisplay(
                        const Color.fromARGB(255, 93, 171, 235), [
                      buildFutureStatDisplay(DatabaseHelper.temperatureTable),
                      const Text(
                        '℃',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                    ]),
                    roundedStatDisplay(Colors.red, [
                      buildFutureStatDisplay(DatabaseHelper.bpmTable),
                      const Text(
                        'BPM',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                    ]),
                    roundedStatDisplay(
                        const Color.fromARGB(255, 252, 186, 186), [
                      buildFutureStatDisplay(DatabaseHelper.oxygenTable),
                      const Text(
                        '%',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                    ]),
                  ]),
            ),
            buildChart(),
            paddedHeader("Healthy Tips", Colors.red),
            const PostsListWidget()
          ]),
    ]);
  }
}
