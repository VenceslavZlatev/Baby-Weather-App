// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_weather_example_flutter/screens/baby_change_options.dart';
import 'package:open_weather_example_flutter/screens/onboarding_screen.dart';
import 'package:open_weather_example_flutter/src/entities/weather/weather.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/current_weather.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/weather_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'preferences/user_simple_preferences.dart';

class setDegree {
  static bool changeDegree = true;
  static bool selectedC = true;
  static bool selectedF = false;
}

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
  }

  Color unselected = Colors.white;
  Color colorSelect = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Settings',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const WeatherPage(
                  city: "London",
                ),
              ),
              (Route<dynamic> route) => false,
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25.sp,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: const Color(0xff292d38),
      body: SafeArea(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0.h, left: 10.h, right: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xffc6c9d2),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      //add child
                    ),
                    title: Text(
                      'Babies',
                      style: TextStyle(color: Colors.white),
                    ),
                    minLeadingWidth: 0,
                    horizontalTitleGap: 5,
                    contentPadding: EdgeInsets.all(0.h),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xff363b49),
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xffc6c9d2),
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                      title: Text(
                        "${Something.mycontroller.text}",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => BabyNameOptions()),
                      ),
                      minLeadingWidth: 0,
                      horizontalTitleGap: 5,
                      contentPadding: EdgeInsets.all(0),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                    Divider(
                      thickness: 2.w,
                    ),
                    ListTile(
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xffc6c9d2),
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                      title: Text(
                        'Some text',
                        style: TextStyle(color: Colors.white),
                      ),
                      minLeadingWidth: 0,
                      horizontalTitleGap: 5,
                      contentPadding: EdgeInsets.all(0),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                    Divider(
                      thickness: 2.w,
                    ),
                    ListTile(
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color(0xffc6c9d2),
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                      title: Text(
                        'Some text',
                        style: TextStyle(color: Colors.white),
                      ),
                      minLeadingWidth: 0,
                      horizontalTitleGap: 5,
                      contentPadding: EdgeInsets.all(0),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                    Divider(
                      thickness: 2.w,
                    ),
                    Center(
                      child: TextButton.icon(
                        onPressed: () {
                          setState(() {});
                        },
                        label: Text(
                          "Add baby",
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        icon: Icon(
                          Icons.add,
                          size: 25.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.h),
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xffc6c9d2),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        CupertinoIcons.thermometer,
                        size: 25.sp,
                      ),
                    ),
                    title: Text(
                      'Units',
                      style: TextStyle(color: Colors.white),
                    ),
                    minLeadingWidth: 0,
                    horizontalTitleGap: 5,
                    contentPadding: EdgeInsets.all(0.h),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xff363b49),
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => setState(() {
                        setDegree.selectedF = false;
                        setDegree.selectedC = true;
                        setDegree.changeDegree = true;
                        print(setDegree.changeDegree);
                      }),
                      selected: setDegree.selectedC,
                      title: Text(
                        'Celsius(\u00B0C)',
                        style: TextStyle(
                            color: setDegree.selectedC
                                ? Colors.blue
                                : Colors.white),
                      ),
                      minLeadingWidth: 0,
                      horizontalTitleGap: 5,
                      contentPadding: EdgeInsets.all(0.h),
                      trailing: Icon(
                        Icons.done,
                        color: setDegree.selectedC ? Colors.blue : colorSelect,
                        size: 20.sp,
                      ),
                    ),
                    Divider(
                      thickness: 2.w,
                    ),
                    ListTile(
                      onTap: () => setState(() {
                        setDegree.selectedF = true;
                        setDegree.selectedC = false;
                        setDegree.changeDegree = false;
                        print(setDegree.changeDegree);
                      }),
                      title: Text(
                        'Ferenheit(\u00B0F)',
                        style: TextStyle(
                            color: setDegree.selectedF
                                ? Colors.blue
                                : Colors.white),
                      ),
                      selected: setDegree.selectedF,
                      minLeadingWidth: 0,
                      horizontalTitleGap: 5,
                      contentPadding: EdgeInsets.all(0.h),
                      trailing: Icon(
                        Icons.done,
                        color: setDegree.selectedF ? Colors.blue : colorSelect,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 4,
                padding: EdgeInsets.only(
                    right: 20.w, left: 20.w, top: 10.h, bottom: 10.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('selectedC', setDegree.selectedC);
                await prefs.setBool('selectedF', setDegree.selectedF);
                await prefs.setBool('setDegree', setDegree.changeDegree);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeatherPage(
                      city: "London",
                    ),
                  ),
                  (Route<dynamic> route) => false,
                );
                // await prefs.setBool('setDegree', setD!);
                // print(setD);
              },
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
