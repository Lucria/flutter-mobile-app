import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_mobile_app/routes/router.gr.dart';
import 'package:flutter_mobile_app/util/util_widgets.dart';

class BluetoothWidget extends StatefulWidget {
  const BluetoothWidget({Key? key}) : super(key: key);

  @override
  _BluetoothWidgetState createState() => _BluetoothWidgetState();
}

class _BluetoothWidgetState extends State<BluetoothWidget> {
  // Phone Related
  BluetoothState _phoneBluetoothState = BluetoothState.UNKNOWN;
  List<BluetoothDevice> _pairedDevicesList = [];
  bool _connected =
      false; // Local tracking. May be false but connection still exist

  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  BluetoothConnection? connection;
  bool get isArduinoConnected =>
      connection != null ? connection!.isConnected : false;
  StreamSubscription? connectionSubscription;

  // Arduino Device Related
  BluetoothDevice? _connectedDevice;

  bool _isButtonUnavailable = false;
  bool isDisconnecting = false;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    if (isArduinoConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Get current Bluetooth state
    FlutterBluetoothSerial.instance.state.then((state) => setState(() {
          _phoneBluetoothState = state;
        }));

    // Enable bluetooth, then get list of paired devices
    Future.doWhile(() async => enableBluetooth())
        .then((_) async => {await getPairedDevices()});

    // Listen for further state changes.
    // For each change, set state and getPairedDevices
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) => setState(() {
              _phoneBluetoothState = state;
              if (_phoneBluetoothState == BluetoothState.STATE_OFF) {
                _isButtonUnavailable = true;
              }
              getPairedDevices();
            }));
  }

  // Request for permission and enable Bluetooth
  Future<bool> enableBluetooth() async {
    _phoneBluetoothState = await FlutterBluetoothSerial.instance.state;

    if (_phoneBluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
    } else {
      await getPairedDevices();
    }
    return false;
  }

  // Retrieve list of already paired devices with phone
  Future<void> getPairedDevices() async {
    List<BluetoothDevice> pairedDevices = [];
    pairedDevices = await _bluetooth.getBondedDevices();
    setState(() => _pairedDevicesList = pairedDevices);
  }

  Widget buildEnableBluetoothWidget(context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Expanded(
            child: Text(
              'Enable Bluetooth',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Switch(
            value: _phoneBluetoothState.isEnabled,
            onChanged: (bool value) {
              future() async {
                if (value) {
                  await FlutterBluetoothSerial.instance.requestEnable();
                } else {
                  await FlutterBluetoothSerial.instance.requestDisable();
                }

                await getPairedDevices();
                _isButtonUnavailable = false;

                if (_connected) {
                  _disconnect();
                }
              }

              future().then((_) {
                setState(() {});
              });
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Visibility(
          visible: _isButtonUnavailable &&
              _phoneBluetoothState == BluetoothState.STATE_ON,
          child: const LinearProgressIndicator(
            backgroundColor: Colors.yellow,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
        buildEnableBluetoothWidget(context),
        Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                paddedHeader("Paired Devices", Colors.blue),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Text(
                        'Device:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          items: _getDeviceItems(),
                          onChanged: (value) => setState(() =>
                              _connectedDevice = value as BluetoothDevice),
                          value: _pairedDevicesList.isNotEmpty
                              ? _connectedDevice
                              : null,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _isButtonUnavailable
                            ? null
                            : _connected
                                ? _disconnect
                                : _connect,
                        child: Text(_connected ? 'Disconnect' : 'Connect'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[400]),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: isArduinoConnected ? Colors.green : Colors.red,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    elevation: isArduinoConnected ? 4 : 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Heartbeat Sensor",
                              style: TextStyle(
                                fontSize: 20,
                                color: isArduinoConnected
                                    ? Colors.green[700]
                                    : Colors.red[700],
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: null,
                            child: Text("ON",
                                style: _connected
                                    ? const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)
                                    : null),
                          ),
                          TextButton(
                            onPressed: null,
                            child: Text("OFF",
                                style: !_connected
                                    ? const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)
                                    : null),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text("View Data"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red[400]),
                  ),
                  onPressed: () {
                    connectionSubscription ??= connection!.input!.listen((data) => {});
                    connection != null
                        ? context
                            .navigateTo(WaveformWidget(connection: connectionSubscription!))
                        : showMessage(context, "Connection is not available");
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "If you cannot find the heartbeat device in the above list, please pair the device first by going to the Bluetooth settings",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    child: const Text("Bluetooth Settings"),
                    onPressed: () {
                      FlutterBluetoothSerial.instance.openSettings();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[400]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Create the List of devices to be shown in Dropdown Menu
  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_pairedDevicesList.isEmpty) {
      items.add(const DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      for (var device in _pairedDevicesList) {
        items.add(DropdownMenuItem(
          child: Text(device.name ?? "", overflow: TextOverflow.ellipsis),
          value: device,
        ));
      }
    }
    return items;
  }

  // Method to connect to bluetooth
  void _connect() async {
    setState(() => _isButtonUnavailable = true);
    if (_connectedDevice == null) {
      showMessage(context, 'No device selected');
      setState(() => _isButtonUnavailable = false);
    } else {
      if (!isArduinoConnected) {
        showMessage(context, 'Attempting connection to Device');
        setState(() => _isButtonUnavailable = false);

        BluetoothConnection.toAddress(_connectedDevice!.address)
            .then((_connection) {
          showMessage(context, 'Connected to the device');
          connection = _connection;
          setState(() => _connected = true);

          connectionSubscription?.onDone(() {
            if (isDisconnecting) {
              showMessage(context, 'Device is disconnected!');
            }
            setState(() {});
          });
        }).catchError((error) {
          // TODO attempt retry by disconnecting and reconnecting
          showMessage(context, 'Cannot connect, exception: $error');
        });
      }
    }
  }

  // Method to disconnect bluetooth
  void _disconnect() async {
    setState(() {
      _isButtonUnavailable = true;
    });

    await connection?.close();
    showMessage(context, 'Device disconnected');
    if (!connection!.isConnected) {
      setState(() {
        _connected = false;
        _isButtonUnavailable = false;
      });
    }
  }
}
