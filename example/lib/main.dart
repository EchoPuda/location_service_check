import 'package:flutter/material.dart';

import 'package:location_service_check/location_service_check.dart';

void main() => runApp(MyApp());

/// demo
/// @author jm
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String locationStatus = "";

  @override
  void initState() {
    super.initState();

  }

  void _check() async {
    bool isOpen = await LocationServiceCheck.checkLocationIsOpen;
    if (isOpen) {
      setState(() {
        locationStatus = "Location service opened";
      });
    } else {
      setState(() {
        locationStatus = "Location service closed";
      });
    }
  }

  void _openSetting() async {
    await LocationServiceCheck.openLocationSetting();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Check location Service'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _check,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Color(0xFF000000),
                    borderRadius: BorderRadius.circular(5.0)
                ),
                child: Text(
                  "Check",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFFFFFFF)
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                "$locationStatus",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: _openSetting,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Color(0xFF333333),
                    borderRadius: BorderRadius.circular(5.0)
                ),
                child: Text(
                  "Open Location Setting",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
