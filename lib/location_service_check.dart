import 'dart:async';

import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

class LocationServiceCheck {
  static MethodChannel _channel =
  const MethodChannel('location_service_check')..setMethodCallHandler(_handler);

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// 获取是否开启了定位服务
  static Future<bool> get checkLocationIsOpen async {
    Map map = await _channel.invokeMethod("checkLocationIsOpen");
    return map["success"];
  }

  /// 打开定位服务设置
  static Future openLocationSetting() async {
    await _channel.invokeMethod("openSetting");
  }

  /// 获取我的定位（经纬度）
  static PublishSubject<LocationData> getMyLocation() {
    _channel.invokeMethod("getLocation");

    return publishSubject;
  }

  static PublishSubject<LocationData> publishSubject = PublishSubject<LocationData>();

  static receiveLocation(Map map) async {
    double lat = map["latitude"];
    double log = map["longitude"];

    LocationData locationData = new LocationData()
      ..latitude = lat
      ..longitude = log;

    publishSubject.add(locationData);

  }

  static Future<dynamic> _handler(MethodCall methodCall) {
    if ("receiveLocation" == methodCall.method) {
      receiveLocation(methodCall.arguments);
    }
    return Future.value(true);
  }

}

/// [latitude] 纬度，[longitude] 经度
class LocationData {
  double latitude;
  double longitude;

  LocationData({this.latitude, this.longitude});

  @override
  String toString() => "latitude: $latitude, longitude: $longitude";
}
