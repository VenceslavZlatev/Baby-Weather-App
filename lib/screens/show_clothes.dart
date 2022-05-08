import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:open_weather_example_flutter/screens/onboarding_screen.dart';
import 'package:open_weather_example_flutter/screens/settings.dart';
import 'package:open_weather_example_flutter/src/entities/weather/weather_data.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/city_search_box.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/current_weather_controller.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/weather_icon_image.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

class CurrentClothes extends ConsumerWidget {
  const CurrentClothes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherDataValue = ref.watch(currentWeatherControllerProvider);
    final city = ref.watch(cityProvider);
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        weatherDataValue.when(
          data: (weatherData) => CurrentWeatherContents(data: weatherData),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, __) => Text(e.toString()),
        ),
      ],
    );
  }
}

class CurrentWeatherContents extends ConsumerWidget {
  const CurrentWeatherContents({Key? key, required this.data})
      : super(key: key);
  final WeatherData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        runSpacing: 20.h,
        direction: Axis.horizontal,
        children: [
          if (data.upperClothes() != "none")
            Container(
              margin: EdgeInsets.only(top: 5.h),
              padding: EdgeInsets.only(
                  top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: const Color.fromARGB(108, 255, 255, 255),
              ),
              child:
                  WeatherIconImage(iconUrl: data.upperClothes(), size: 100.h),
            ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            padding:
                EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: const Color.fromARGB(108, 255, 255, 255),
            ),
            child: WeatherIconImage(iconUrl: data.headClothes(), size: 100.h),
          ),
          if (data.blozeClothes() != "none")
            Container(
              margin: EdgeInsets.only(top: 5.h),
              padding: EdgeInsets.only(
                  top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: const Color.fromARGB(108, 255, 255, 255),
              ),
              child:
                  WeatherIconImage(iconUrl: data.blozeClothes(), size: 100.h),
            ),
          if (data.shirtClothes() != "none")
            Container(
              margin: EdgeInsets.only(top: 5.h),
              padding: EdgeInsets.only(
                  top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: const Color.fromARGB(108, 255, 255, 255),
              ),
              child:
                  WeatherIconImage(iconUrl: data.shirtClothes(), size: 100.h),
            ),
          if (data.pantsClothes() != "none")
            Container(
              margin: EdgeInsets.only(top: 5.h),
              padding: EdgeInsets.only(
                  top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: const Color.fromARGB(108, 255, 255, 255),
              ),
              child:
                  WeatherIconImage(iconUrl: data.pantsClothes(), size: 100.h),
            ),
          if (data.feetClothes() != "none")
            Container(
              margin: EdgeInsets.only(top: 5.h),
              padding: EdgeInsets.only(
                  top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: const Color.fromARGB(108, 255, 255, 255),
              ),
              child: WeatherIconImage(iconUrl: data.feetClothes(), size: 100.h),
            ),
        ],
      ),
    );
  }
}
