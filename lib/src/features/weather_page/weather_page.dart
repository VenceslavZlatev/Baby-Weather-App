import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_weather_example_flutter/screens/bottom_option.dart';
import 'package:open_weather_example_flutter/screens/settings.dart';
import 'package:open_weather_example_flutter/src/constants/app_colors.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/city_search_box.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/current_weather.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:open_weather_example_flutter/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  double _opacity = 1;

  double _margin = 0;

  double _width = double.infinity;

  late double _height = MediaQuery.of(context).size.height * 0.5;

  Color _color = Colors.white;

  _getRequests() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setState(() {});

    CurrentWeather();
  }

  // late final WeatherData data;
  // late final data2 = data.date.hour == 19;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10.w,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: Something.gen == "Female"
              ? AppColors.rainGradientBaby
              : AppColors.rainGradient,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              //color: Colors.white,
              Column(
                children: [
                  // Text("${Something.gen}"),
                  // Text(Configure.changeC.text),
                  // Text(
                  //     '${Something.dateTime.day}.${Something.dateTime.month}.${Something.dateTime.year}'),
                  SizedBox(
                    height: 15.h,
                  ),
                  const CitySearchBox(),
                  SizedBox(
                    height: 15.h,
                  ),
                  GlassContainer(
                    height: 300,
                    width: 300,
                    //isFrostedGlass: true,
                    //frostedOpacity: 0.05,
                    blur: 100,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.25),
                        Colors.white.withOpacity(0.35),
                        Colors.white.withOpacity(0.35),
                        Colors.white.withOpacity(0.05),
                      ],
                      //stops: [0.0, 1, 1.0, 0],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderGradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.60),
                        Colors.white.withOpacity(0.60),
                        Colors.white.withOpacity(0.60),
                        Colors.white.withOpacity(0.60),
                      ],
                      stops: [0.0, 0.45, 0.55, 1.0],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(90.0.r),
                    child: const FittedBox(
                      fit: BoxFit.contain,
                      child: CurrentWeather(),
                    ),
                    padding: EdgeInsets.all(16.0.r),
                  ),
                  const BottomOption(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context)
                          .push(
                            MaterialPageRoute(builder: (_) => Settings()),
                          )
                          .then((val) => {_getRequests()});
                    },
                    child: Text("go settings"),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 50.h,
                      ),
                      child: Text(
                        'Outfit for ${Something.mycontroller.text}',
                        style: TextStyle(fontSize: 17.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //Spacer(),

        //const HourlyWeather(),
        // Stack(
        //   children: [
        //     Align(
        //       alignment: Alignment.center,
        //       child: const HourlyWeather(),
        //     ),
        //     AnimatedContainer(
        //       duration: const Duration(seconds: 1),
        //       margin: EdgeInsets.only(top: _margin),
        //       height: _height,
        //       width: _width,
        //       color: _color,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: <Widget>[
        //           Text('Today'),
        //           IconButton(
        //             onPressed: () => setState(() {
        //               // if (_height ==
        //               //     MediaQuery.of(context).size.height * 0.3) {
        //               //   _height =
        //               //       MediaQuery.of(context).size.height * 0.5;
        //               // } else {
        //               //   _height =
        //               //       MediaQuery.of(context).size.height * 0.3;
        //               // }
        //               if (_margin == 100) {
        //                 _margin = 0;
        //                 _height =
        //                     MediaQuery.of(context).size.height * 0.5;
        //               } else {
        //                 _margin = 100;
        //                 _height =
        //                     MediaQuery.of(context).size.height * 0.38;
        //               }
        //             }),
        //             icon: Icon(
        //               Icons.arrow_downward,
        //               color: Colors.purple,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),

        //Spacer(),
      ),
    );
  }
}
