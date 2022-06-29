import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_geolocation_service/flutter_geolocation_service.dart';
import 'package:flutter_geolocation_service/flutter_geolocation_service_platform_interface.dart';
import 'package:flutter_geolocation_service/flutter_geolocation_service_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterGeolocationServicePlatform
    with MockPlatformInterfaceMixin
    implements FlutterGeolocationServicePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterGeolocationServicePlatform initialPlatform =
      FlutterGeolocationServicePlatform.instance;

  test('$MethodChannelFlutterGeolocationService is the default instance', () {
    expect(initialPlatform,
        isInstanceOf<MethodChannelFlutterGeolocationService>());
  });

  test('getPlatformVersion', () async {
    FlutterGeolocationService flutterGeolocationServicePlugin =
        FlutterGeolocationService();
    MockFlutterGeolocationServicePlatform fakePlatform =
        MockFlutterGeolocationServicePlatform();
    FlutterGeolocationServicePlatform.instance = fakePlatform;

    expect(await FlutterGeolocationService.checkPermission(), false);
  });
}
