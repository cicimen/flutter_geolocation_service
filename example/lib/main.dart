import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_geolocation_service/flutter_geolocation_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _permission = 'Unknown';
  final _flutterGeolocationServicePlugin = FlutterGeolocationService();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    bool permisssion;
    try {
      permisssion = true;
      //permisssion = await FlutterGeolocationService.checkPermission() ?? false;
    } on PlatformException {
      permisssion = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _permission = permisssion.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Geolocation example app'),
        ),
        body: Center(
          child: Text('Running on: $_permission\n'),
        ),
      ),
    );
  }
}
