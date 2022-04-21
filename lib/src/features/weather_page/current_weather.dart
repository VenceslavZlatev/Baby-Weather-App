import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class CurrentWeather extends ConsumerWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherDataValue = ref.watch(currentWeatherControllerProvider);
    final city = ref.watch(cityProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        weatherDataValue.when(
          data: (weatherData) => CurrentWeatherContents(data: weatherData),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, __) => Text(e.toString()),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.h),
          padding:
              EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 20.sp,
              ),
              Text(
                city.capitalize(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.25),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 0.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
    final textTheme = Theme.of(context).textTheme;

    final tempC = data.temp.celsius.toInt().toString();
    final tempF = data.temp.farhenheit.toInt().toString();
    final minTemp = data.minTemp.celsius.toInt().toString();
    final maxTemp = data.maxTemp.celsius.toInt().toString();
    final highAndLow = 'H:$maxTemp° L:$minTemp°';
    final description = data.description;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherIconImage(iconUrl: data.findMainIcon(), size: 150.h),
        Text(
          setDegree.changeDegree! ? tempC + "\u00B0C" : tempF + "\u00B0F",
          style: TextStyle(
            color: Colors.black,
            fontSize: 50.sp,
            fontWeight: FontWeight.w500,
            shadows: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 0.5),
              ),
            ],
          ),
        ),
        Text(description),
        Text(highAndLow, style: textTheme.bodyText2),
      ],
    );
  }
}
