import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_weather_example_flutter/screens/onboarding_screen.dart';
import 'package:open_weather_example_flutter/widgets/dismiss.dart';
//import 'package:open_weather_example_flutter/src/features/weather_page/weather_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyleWithShadow = TextStyle(color: Colors.black, shadows: [
      BoxShadow(
        color: Colors.black12.withOpacity(0.25),
        spreadRadius: 1,
        blurRadius: 4,
        offset: const Offset(0, 0.5),
      )
    ]);
    return ScreenUtilInit(
      designSize: const Size(412, 869),
      minTextAdapt: true,
      builder: (_) => DismissKeyboard(
        child: MaterialApp(
          title: 'BabyWeather',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            bottomSheetTheme:
                const BottomSheetThemeData(backgroundColor: Colors.transparent),
            appBarTheme: const AppBarTheme(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            brightness: Brightness.light,
            textTheme: TextTheme(
              headline1: textStyleWithShadow,
              headline2: textStyleWithShadow,
              headline3: textStyleWithShadow,
              headline4: textStyleWithShadow,
              headline5: textStyleWithShadow,
              subtitle1: const TextStyle(color: Colors.white),
              bodyText2: const TextStyle(color: Colors.black),
              bodyText1: const TextStyle(color: Colors.white),
              caption: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
          home: const OnBoard(),
        ),
      ),
    );
  }
}
