#import "LocationServiceCheckPlugin.h"
#import <CoreLocation/CoreLocation.h>

@implementation LocationServiceCheckPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"location_service_check"
            binaryMessenger:[registrar messenger]];
  LocationServiceCheckPlugin* instance = [[LocationServiceCheckPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"checkLocationIsOpen" isEqualToString:call.method]) {
      [self checkLocationIsOpen:result];
  } else if ([@"openSetting" isEqualToString:call.method]) {
      [self openSetting];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)checkLocationIsOpen:(FlutterResult)result {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if ([CLLocationManager locationServicesEnabled] == YES) {
        dic[@"success"] = @YES;
    } else {
        dic[@"success"] = @NO;
    }
    result(dic);
}

- (void)openSetting {
    NSURL *url = [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
    if (@available(iOS 10.0, *)) {
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:^(BOOL success) {
            }];
        }
    } else {
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            [[UIApplication sharedApplication]openURL:url];
        }
    };

}

@end
