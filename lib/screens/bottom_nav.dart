import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:open_weather_example_flutter/screens/settings.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/current_weather.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // @override
  // void initState() {
  //   super.initState();
  // }

  //PersistentTabController _controller;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 80.h,
      width: MediaQuery.of(context).size.width,
      //isFrostedGlass: true,
      //frostedOpacity: 0.05,
      blur: 100,
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.25),
          Colors.white.withOpacity(0.05),
        ],
        //stops: [0.0, 1, 1.0, 0],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.60),
          Colors.white.withOpacity(0.60),
          Colors.white.withOpacity(0.60),
          Colors.white.withOpacity(0.60),
        ],
        stops: const [0.0, 0.45, 0.55, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              color: const Color(0xffe6effb),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.cloud_outlined,
              size: 23.sp,
              color: Colors.black87,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              color: const Color(0xffe6effb),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.settings_accessibility,
              size: 23.sp,
              color: Colors.black87,
            ),
          ),
          InkWell(
            onTap: () {
              //Navigator.pop(context);
              _navigateback(context);
            },
            child: Container(
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                color: const Color(0xffe6effb),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.settings,
                size: 23.sp,
                color: Colors.black87,
              ),
            ),
          )
        ],
      ),
      padding: EdgeInsets.all(16.0.r),
    );
  }

  _navigateback(BuildContext context) async {
    setDegree.changeDegree = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Settings()),
    );
    setState(() {});
  }
}
