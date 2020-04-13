# location_service_check

A plugin to check location service.

## Getting Started
支持Android和iOS
<br>

# 使用方法
```
pubspec.yaml:
  location_service_check:
    git:
      url: https://github.com/EchoPuda/location_service_check.git
```
      
# import
```
import 'package:location_service_check/location_service_check.dart';
```

# 检查是否开启了定位服务
```
  bool open = await LocationServiceCheck.checkLocationIsOpen;
```
  
# 打开定位设置页
```
  await LocationServiceCheck.openLocationSetting;
```
  
  Android直接打开系统的定位服务， iOS由于ios10开始不支持打开系统详细设置，所以打开应用的设置页。
