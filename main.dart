
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:usb_serial/usb_serial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ControlPage(),
    );
  }
}

class ControlPage extends StatefulWidget {
  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  BluetoothConnection? btConnection;
  UsbPort? usbPort;

  void sendData(String data) {
    if (btConnection != null && btConnection!.isConnected) {
      btConnection!.output.add(Uint8List.fromList(data.codeUnits));
    } else if (usbPort != null) {
      usbPort!.write(Uint8List.fromList(data.codeUnits));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Robot Arm Controller")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => sendData("M1:90,M2:90,M3:90,M4:90\n"),
              child: Text("Move All to 90°"),
            ),
            ElevatedButton(
              onPressed: () => sendData("M1:0,M2:0,M3:0,M4:0\n"),
              child: Text("Move All to 0°"),
            ),
          ],
        ),
      ),
    );
  }
}
