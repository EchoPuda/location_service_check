import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location_service_check/location_service_check.dart';

void main() {
  const MethodChannel channel = MethodChannel('location_service_check');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await LocationServiceCheck.platformVersion, '42');
  });
}
