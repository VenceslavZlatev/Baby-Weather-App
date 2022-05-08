// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:open_weather_example_flutter/screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../src/features/weather_page/weather_page.dart';
import 'onboarding_screen.dart';
import 'preferences/user_simple_preferences.dart';

class Configure {
  static final changeC = Something.mycontroller;
  static final newgender = Something.gen;
}

class BabyNameOptions extends StatefulWidget {
  const BabyNameOptions({Key key}) : super(key: key);

  @override
  State<BabyNameOptions> createState() => _BabyNameOptionsState();
}

class _BabyNameOptionsState extends State<BabyNameOptions> {
  final _formKey = GlobalKey<FormState>();

  String name = Something.mycontroller.text;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Configure',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Settings(),
            ),
            (Route<dynamic> route) => false,
          ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xff363b49),
                  borderRadius: BorderRadius.circular(50)),
              margin: EdgeInsets.all(10.h),
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: Column(
                  children: [
                    Row(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Your baby's name:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      width: 200.w,
                      height: 50.h,
                      padding: EdgeInsets.all(3.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: const Color(0xff292d38),
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
                          onChanged: (name) => setState(() => this.name = name),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textCapitalization: TextCapitalization.characters,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            isDense: true, // Added this
                            contentPadding: EdgeInsets.all(12.h),
                            hintText: "${Something.mycontroller.text}",
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp),
                            fillColor: const Color(0xffb598c7),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.w, color: Colors.white),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.w, color: Colors.white),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Your baby's birth:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 200.w,
                      height: 50.h,
                      padding: EdgeInsets.all(3.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: const Color(0xff292d38),
                      ),
                      child: CaperDate(context),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(20.h),
                      child: GenderPickerWithImage(
                        showOtherGender: true,
                        // verticalAlignedText: alignVertical,
                        maleImage: const AssetImage('assets/images/2.png'),
                        femaleImage: const AssetImage('assets/images/1.png'),
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
                          print(Something.selectedgender);
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
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('name', Something.mycontroller.text);
                          prefs.setInt('gender', Something.setgender);
                          prefs.setString(
                              'dateTime', Something.dateTime.toIso8601String());

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Settings(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        }
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
            ),
          ],
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
        '${Something.dateTime.day}.${Something.dateTime.month}.${Something.dateTime.year}',
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
