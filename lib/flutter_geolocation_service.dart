
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterGeolocationService {
  static const MethodChannel _channel =
      const MethodChannel('flutter_geolocation_service');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
