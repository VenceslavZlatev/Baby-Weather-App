import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:open_weather_example_flutter/screens/settings.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/city_search_box.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/weather_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/current_weather_controller.dart';
import 'preferences/user_simple_preferences.dart';

class Something {
  static String? gen = "Male";
  static Gender selectedgender = Gender.Male;
  static final mycontroller = TextEditingController();
  static DateTime? dateTime = DateTime.now();
  static int? setgender = 2;
  static bool showHome = false;
  static String saveCity = "Sofia";
  static bool checkT = true;
}

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  String? name = Something.mycontroller.text;
  //int? setgender = Something.selectedgender.index;
  //DateTime? birthday;
  final controller = PageController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    //getData();
  }

  // getData() {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Something.mycontroller.text = prefs.getString("name")!;
  //   Something.setgender = prefs.getInt('gender');
  //   Something.dateTime = DateTime.parse(prefs.getString('dateTime')!);
  //   Something.showHome = prefs.getBool("showHome")!;
  //   setDegree.changeDegree = prefs.getBool('setDegree');
  //   setDegree.selectedC = prefs.getBool('selectedC');
  //   setDegree.selectedF = prefs.getBool('selectedF');
  //   setState(() {
  //     print(Something.dateTime);
  //     print(Something.selectedgender);
  //     //Something.mycontroller.text = name!;
  //     if (Something.setgender == 1) {
  //       Something.selectedgender = Gender.Others;
  //     } else if (Something.setgender == 0) {
  //       Something.selectedgender = Gender.Female;
  //     } else if (Something.setgender == 2) {
  //       Something.selectedgender = Gender.Male;
  //     }
  //     print(Something.selectedgender);
  //     print(Something.setgender);
  //   });
  //   //Something.dateTime = UserSimplePreferences.getBirthday()!;
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Color(0xffb598c7),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: PageView(
            controller: controller,
            children: [
              Container(
                margin: EdgeInsets.only(top: 70.h),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 30.sp, color: Colors.black),
                        children: const <TextSpan>[
                          TextSpan(text: 'Baby'),
                          TextSpan(
                            text: 'Weather',
                            style: TextStyle(
                              color: Color(0xff41beec),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 20.h, bottom: 30.h, left: 25.w, right: 25.w),
                      padding: EdgeInsets.only(
                          top: 120.h, bottom: 120.h, right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        "Meet BabyWeather app that helps you to dress up your baby in any weather and place! But first please share some details about you baby!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.sp,
                          // fontFamily: 'Roboto',
                          // fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 4,
                        padding: EdgeInsets.only(
                            right: 20.w, left: 20.w, top: 15.h, bottom: 15.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                      ),
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                      icon: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          // fontFamily: 'Roboto',
                          // fontWeight: FontWeight.w400
                        ),
                      ),
                      label: Icon(
                        Icons.arrow_forward_ios,
                        size: 20.sp,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          // fontFamily: 'Roboto',
                          // fontWeight: FontWeight.w400
                        ),
                        children: const <TextSpan>[
                          TextSpan(text: 'Sign in or Sign up'),
                          TextSpan(
                            text: ' for free!',
                            style: TextStyle(
                              color: Color(0xffA351d6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70.h),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 30.sp, color: Colors.black),
                        children: const <TextSpan>[
                          TextSpan(text: 'Baby'),
                          TextSpan(
                            text: 'Weather',
                            style: TextStyle(
                              color: Color(0xff41beec),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 20.h, bottom: 30.h, left: 25.w, right: 25.w),
                      padding: EdgeInsets.only(
                          top: 75.h, bottom: 75.h, right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(),
                          Text(
                            "Your baby's name:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.sp,
                              // fontFamily: 'Roboto',
                              // fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          //do text field
                          Container(
                            width: 200.w,
                            padding: EdgeInsets.all(3.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              color: const Color(0xffe1c8f1),
                            ),
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter a name";
                                  }
                                  return null;
                                },
                                controller: Something.mycontroller,
                                //initialValue: name,
                                onChanged: (name) =>
                                    setState(() => this.name = name),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textCapitalization:
                                    TextCapitalization.characters,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  isDense: true, // Added this
                                  contentPadding: EdgeInsets.all(10.h),
                                  hintText: "EMMA",
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.sp),
                                  fillColor: const Color(0xffb598c7),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.w, color: Colors.white),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.w, color: Colors.white),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            "Your baby's sex:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.sp,
                              // fontFamily: 'Roboto',
                              // fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 30.h),

                          GenderPickerWithImage(
                            showOtherGender: true,
                            // verticalAlignedText: alignVertical,
                            maleImage: const AssetImage('assets/images/2.png'),
                            femaleImage:
                                const AssetImage('assets/images/1.png'),
                            otherGenderImage:
                                const AssetImage('assets/images/3.png'),
                            maleText: '',
                            femaleText: '',
                            otherGenderText: '',
                            // to show what's selected on app opens, but by default it's Male
                            selectedGender: Something.selectedgender,
                            linearGradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 255, 255, 255),
                                  Color.fromARGB(255, 129, 15, 199)
                                ],
                                tileMode: TileMode.clamp,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [-1, 1]),
                            onChanged: (setgender) {
                              if (setgender == Gender.Female) {
                                Something.gen = "Female";
                                Something.selectedgender = Gender.Female;
                                Something.setgender = 0;
                              } else if (setgender == Gender.Male) {
                                Something.gen = "Male";
                                Something.selectedgender = Gender.Male;
                                Something.setgender = 2;
                              } else if (setgender == Gender.Others) {
                                Something.gen = "Other";
                                Something.selectedgender = Gender.Others;
                                Something.setgender = 1;
                              }
                            },
                            //Alignment between icons
                            equallyAligned: true,

                            animationDuration: Duration(milliseconds: 300),
                            isCircular: true,
                            // default : true,
                            opacityOfGradient: 0.4,
                            padding: const EdgeInsets.all(4),
                            size: 70, //default : 40
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 4,
                            padding: EdgeInsets.only(
                                right: 20.w,
                                left: 20.w,
                                top: 15.h,
                                bottom: 15.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                          onPressed: () {
                            controller.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 20.sp,
                            color: Colors.blue,
                          ),
                          label: Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              // fontFamily: 'Roboto',
                              // fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 4,
                            padding: EdgeInsets.only(
                                right: 20.w,
                                left: 20.w,
                                top: 15.h,
                                bottom: 15.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            }
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString(
                                'name', Something.mycontroller.text);
                            prefs.setInt('gender', Something.setgender!);
                            print(Something.setgender);
                          },
                          icon: Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              // fontFamily: 'Roboto',
                              // fontWeight: FontWeight.w400
                            ),
                          ),
                          label: Icon(
                            Icons.arrow_forward_ios,
                            size: 20.sp,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70.h),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 30.sp, color: Colors.black),
                        children: const <TextSpan>[
                          TextSpan(text: 'Baby'),
                          TextSpan(
                            text: 'Weather',
                            style: TextStyle(
                              color: Color(0xff41beec),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 20.h, bottom: 30.h, left: 25.w, right: 25.w),
                      padding: EdgeInsets.only(
                          top: 120.h, bottom: 120.h, right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(),
                          Text(
                            "Birth of your baby:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            width: 200.w,
                            height: 50.h,
                            padding: EdgeInsets.all(3.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              color: const Color(0xffe1c8f1),
                            ),
                            child: CaperDate(context),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 35.w,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 4,
                        padding: EdgeInsets.only(
                            right: 20.w, left: 20.w, top: 15.h, bottom: 15.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WeatherPage(
                              city: "London",
                            ),
                          ),
                        );

                        Something.showHome = true;

                        // await UserSimplePreferences.setBirthday(
                        //     Something.dateTime!);

                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString(
                            'dateTime', Something.dateTime!.toIso8601String());
                        prefs.setBool('showHome', Something.showHome);
                        print(Something.dateTime);
                      },
                      icon: Text(
                        'Complete',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          // fontFamily: 'Roboto',
                          // fontWeight: FontWeight.w400
                        ),
                      ),
                      label: Icon(
                        Icons.arrow_forward_ios,
                        size: 20.sp,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          color: Colors.transparent,
          height: 80.h,
          child: Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const WormEffect(
                  activeDotColor: Color(0xff41beec), dotColor: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  TextButton CaperDate(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
            side: BorderSide(width: 2.w, color: Colors.white)),
      ),
      child: Text(
        '${Something.dateTime!.day}.${Something.dateTime!.month}.${Something.dateTime!.year}',
        style: TextStyle(color: Colors.white, fontSize: 18.sp),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            insetPadding: EdgeInsets.all(15.r),
            contentPadding: EdgeInsets.only(left: 20.w, right: 20.w),
            alignment: Alignment.bottomCenter,
            title: Text(
              'Select birthday date',
              style: TextStyle(fontSize: 20.sp),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0.r),
              ),
            ),
            content: Container(
              width: 500.w,
              height: 450.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 350.h,
                    child: CupertinoDatePicker(
                      use24hFormat: true,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (dateTime) {
                        setState(() {
                          Something.dateTime = dateTime;
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(500.w, 40.h),
                      primary: const Color(0xffb598c7),
                      elevation: 4,
                      padding: EdgeInsets.only(
                          right: 20.w, left: 20.w, top: 15.h, bottom: 15.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    child: Text(
                      "Done",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
