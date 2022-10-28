import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class WaveformWidget extends StatefulWidget {
  const WaveformWidget({Key? key, required this.connection}) : super(key: key);

  final BluetoothConnection connection;

  @override
  State<StatefulWidget> createState() => _WaveformWidgetState();
}

class _WaveformWidgetState extends State<WaveformWidget> {
  List<int> _buffer = List<int>.empty(growable: true);

  final Color waveColour = Colors.redAccent;
  final limitCount = 1000;
  final dataPoints = <FlSpot>[];

  double xValue = 0;
  double step = 0.05;

  late Timer timer;

  @override
  void initState() {
    super.initState();

    widget.connection.input!.listen(_onDataReceived);

    timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      while (dataPoints.length > limitCount) {
        dataPoints.removeAt(0);
      }
      
      setState(() {
        dataPoints.add(FlSpot(xValue, sin(xValue))); // TODO add data here from bluetooth
      });
      xValue += step;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return dataPoints.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'x: ${xValue.toStringAsFixed(1)}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'sin: ${dataPoints.last.y.toStringAsFixed(1)}',
                style: TextStyle(
                  color: waveColour,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: LineChart(
                  LineChartData(
                    minY: -1,
                    maxY: 1,
                    minX: dataPoints.first.x,
                    maxX: dataPoints.last.x,
                    lineTouchData: LineTouchData(enabled: false),
                    clipData: FlClipData.all(),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                    ),
                    lineBarsData: [
                      sinLine(dataPoints),
                    ],
                    titlesData: FlTitlesData(
                      show: false,
                    ),
                  ),
                ),
              )
            ],
          )
        : Container();
  }

  LineChartBarData sinLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points,
      dotData: FlDotData(
        show: false,
      ),
      gradient: LinearGradient(
        colors: [waveColour.withOpacity(0), waveColour],
        stops: const [0.1, 1.0],
      ),
      barWidth: 4,
      isCurved: false,
    );
  }

  void _onDataReceived(Uint8List data) {
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
        print(_decodeDataPacket(dataPacket));
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
  
  int _decodeDataPacket(String dataPacket) {
    if (dataPacket.startsWith("S")) {
      int sampledValue = int.parse(dataPacket.substring(1));
      return sampledValue;
    }
    return -999999;
  }
}
