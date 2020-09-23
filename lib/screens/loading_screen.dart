import 'dart:io';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  Location location = Location();

  void getLocationData() async {
    var weatherData;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        weatherData = await WeatherModel().getLocationWeather();
        print('connected');
      }
    } on SocketException catch (_) {
      weatherData = null;
      print('not connected');
    }
//    dynamic weatherData;
//    try {
//      var weatherData = await (WeatherModel().getLocationWeather())
//          .timeout(const Duration(seconds: 20));
//    } catch (e) {
//      print('Failed to get data by $e');
//    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
