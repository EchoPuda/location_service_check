import 'dart:async';

import 'package:flutter/services.dart';

/// @author jm
class LocationServiceCheck{
  static const MethodChannel _channel =
      const MethodChannel('location_service_check');

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
}
