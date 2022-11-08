import 'dart:async';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/util/database.dart';
import 'package:flutter_mobile_app/util/util_widgets.dart';

class WaveformWidget extends StatefulWidget {
  const WaveformWidget({Key? key, required this.connection}) : super(key: key);

  final StreamSubscription connection;

  @override
  State<StatefulWidget> createState() => _WaveformWidgetState();
}

class _WaveformWidgetState extends State<WaveformWidget> {
  List<int> _buffer = List<int>.empty(growable: true);
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  final Color waveColour = Colors.redAccent;
  final limitCount = 100;
  final dataPoints = <FlSpot>[];

  final defaultTemperature = 35;
  final defaultOxygen = 100;
  final defaultBPM = 60;

  final rawSamplePoints = List<int>.empty(growable: true);
  final rawTemperaturePoints = List<int>.empty(growable: true);
  final rawOxygenPoints = List<int>.empty(growable: true);
  final rawBPMPoints = List<int>.empty(growable: true);

  double xValue = 0;
  double step = 0.05;

  late Timer timer;

  @override
  void initState() {
    super.initState();

    widget.connection.onData(_onDataReceived);

    rawTemperaturePoints.add(defaultTemperature);
    rawOxygenPoints.add(defaultOxygen);
    rawBPMPoints.add(defaultBPM);
    _addStatDatabaseValues(defaultTemperature, defaultOxygen, defaultBPM);

    timer = Timer.periodic(const Duration(milliseconds: 70), (timer) {
      while (dataPoints.length > limitCount) {
        dataPoints.removeAt(0);
      }

      if (rawSamplePoints.isNotEmpty) {
        double firstValue = rawSamplePoints.first.toDouble();
        rawSamplePoints.removeAt(0);
        setState(() {
          dataPoints.add(FlSpot(xValue, firstValue));
        });
        xValue += step;
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 120,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                roundedStatDisplay(
                     const Color.fromARGB(255, 93, 171, 235), [
                  Text(
                    rawTemperaturePoints.last.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 32),
                  ),
                  const Text(
                    '℃',
                    style: TextStyle(fontSize: 15),
                  ),
                ]),
                roundedStatDisplay(Colors.red, [
                  Text(
                    rawBPMPoints.last.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 32),
                  ),
                  const Text(
                    'BPM',
                    style: TextStyle(fontSize: 15),
                  ),
                ]),
                roundedStatDisplay(
                    const Color.fromARGB(255, 252, 186, 186), [
                  Text(
                    rawOxygenPoints.last.toString(),
                    style: const TextStyle(fontSize: 32),
                  ),
                  const Text(
                    '%',
                    style: TextStyle(fontSize: 15),
                  ),
                ]),
              ]),
        ),
        dataPoints.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: LineChart(
                      LineChartData(
                        minY: dataPoints.map((value) => value.y).reduce(min),
                        maxY: dataPoints.map((value) => value.y).reduce(max),
                        minX: dataPoints.first.x,
                        maxX: dataPoints.last.x,
                        lineTouchData: LineTouchData(enabled: false),
                        clipData: FlClipData.all(),
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                        ),
                        lineBarsData: [
                          waveformLine(dataPoints),
                        ],
                        titlesData: FlTitlesData(
                          show: false,
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Container()
      ],
    );
  }

  LineChartBarData waveformLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points,
      dotData: FlDotData(
        show: false,
      ),
      gradient: LinearGradient(
        colors: [waveColour.withOpacity(0), waveColour],
        stops: const [0.1, 1.0],
      ),
      barWidth: 2,
      isCurved: false,
    );
  }

  void _onDataReceived(data) {
    // Allocate buffer for received ASCII data
    _buffer += data;

    while (true) {
      // Look for CRLF denoted by ASCII 13, 10
      int index = _buffer.indexOf(10); // Returns the first occurrence of LF
      if (index >= 2 && _buffer.isNotEmpty) {
        var dataPoint = [];
        // Do not parse CRLF
        for (int i = 0; i <= index - 2; i++) {
          dataPoint.add(_buffer[i]);
        }
        _buffer.removeRange(0, index + 1);
        String dataPacket = _parseDataReceived(dataPoint);
        _decodeDataPacket(dataPacket);
      } else {
        break; // Must break from while true loop
      }
    }
  }

  // Parse list of integer ascii codes to a String
  String _parseDataReceived(List listOfAscii) {
    return listOfAscii
        .map((asciiCode) => String.fromCharCode(asciiCode))
        .join();
  }

  // Decodes various data packets from String to their integer values
  int _decodeDataPacket(String dataPacket) {
    int sampledValue = num.tryParse(dataPacket.substring(1))!.toInt();
    int currentTime = DateTime.now().millisecondsSinceEpoch;

    // Raw Signal Values
    if (dataPacket.startsWith("S")) {
      rawSamplePoints.add(sampledValue);
      _databaseHelper.insert(DatabaseHelper.rawSensorTable, SensorData(sampledValue, currentTime).toMap());
    }
    // Heart Rate Data
    else if (dataPacket.startsWith("H")) {
      rawBPMPoints.add(sampledValue);
      _databaseHelper.insert(DatabaseHelper.bpmTable, BpmData(sampledValue, currentTime).toMap());
    }
    // Temperature Data
    else if (dataPacket.startsWith("T")) {
      rawTemperaturePoints.add(sampledValue);
      _databaseHelper.insert(DatabaseHelper.temperatureTable, TemperatureData(sampledValue, currentTime).toMap());
    }
    // Oxygen Data
    else if (dataPacket.startsWith("O")) {
      rawOxygenPoints.add(sampledValue);
      _databaseHelper.insert(DatabaseHelper.oxygenTable, OxygenData(sampledValue, currentTime).toMap());
    }
    return sampledValue;
  }

  void _addStatDatabaseValues(int temp, int oxy, int bpm) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    _databaseHelper.insert(DatabaseHelper.temperatureTable, TemperatureData(temp, currentTime).toMap());
    _databaseHelper.insert(DatabaseHelper.oxygenTable, OxygenData(oxy, currentTime).toMap());
    _databaseHelper.insert(DatabaseHelper.bpmTable, BpmData(bpm, currentTime).toMap());
  }
}
