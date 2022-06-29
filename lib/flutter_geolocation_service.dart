import 'dart:async';
import 'package:flutter/services.dart';

class FlutterGeolocationService {
  static const MethodChannel _channel =
      const MethodChannel('flutter_geolocation_service');

  static Function(Map? res)? _eventsCallback;
  static Function(Map? res)? _locationCallback;
  static Function(Map? res)? _clientLocationCallback;
  static Function(Map? res)? _errorCallback;
  static Function(Map? res)? _logCallback;

  static Future init(String publishableKey) async {
    try {
      await _channel.invokeMethod('init');
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static Future<bool?> checkPermission() async {
    return await _channel.invokeMethod('checkPermission');
  }

  static Future<String?> getPermissionsStatus() async {}

  static Future requestPermission(bool background) async {
    try {
      return await _channel
          .invokeMethod('requestPermission', {'background': background});
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
