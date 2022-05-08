import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:open_weather_example_flutter/screens/settings.dart';
import 'package:open_weather_example_flutter/screens/onboarding_screen.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/weather_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getData();
    super.initState();
    startTime();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Something.showHome = prefs.getBool("showHome")!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Something.showHome
                ? const WeatherPage(city: "Sofia")
                : const OnBoard()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffeef2),
      body: Center(child: Image.asset('assets/images/splash.png')),
    );
  }
}
