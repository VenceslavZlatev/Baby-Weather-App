import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_weather_example_flutter/screens/hourly_weather_days.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/hourly_weather.dart';

class BottomOption extends StatefulWidget {
  const BottomOption({Key? key}) : super(key: key);

  @override
  State<BottomOption> createState() => _BottomOptionState();
}

class _BottomOptionState extends State<BottomOption>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void modalbottomsheet(context) {
    showModalBottomSheet(
      //barrierColor: Color.fromARGB(26, 0, 0, 0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Color(0xffD9E6EA),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(10.h),
          height: 400.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.h),
                height: 5.h,
                width: 50.w,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(125, 160, 160, 160),
                    borderRadius: BorderRadius.all(Radius.circular(20.r))),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  //color: Color.fromARGB(41, 158, 158, 158),
                ),
                height: 330.h,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.h),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(144, 65, 190, 236),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: TabBar(
                        padding: EdgeInsets.all(5.h),
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.black,
                        indicatorColor: Colors.white,
                        indicatorWeight: 2,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        controller: tabController,
                        tabs: [
                          Tab(
                            child: Text(
                              "3-hour",
                              style: TextStyle(fontSize: 17.sp),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "5-day",
                              style: TextStyle(fontSize: 17.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 50.0.h),
                        child: TabBarView(
                          controller: tabController,
                          children: const [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: HourlyWeather(),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: HourlyWeatherdays(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => modalbottomsheet(context),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding:
              EdgeInsets.only(top: 10.h, bottom: 10.h, left: 40.w, right: 40.w),
          margin: EdgeInsets.only(top: 20.h),
          decoration: BoxDecoration(
            color: const Color.fromARGB(83, 255, 255, 255),
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Column(
            children: [
              Text(
                "Today",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Image.asset(
                'assets/images/down-arrow.png',
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
