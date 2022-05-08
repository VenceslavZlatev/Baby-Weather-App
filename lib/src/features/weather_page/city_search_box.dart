import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';
import 'package:open_weather_example_flutter/screens/onboarding_screen.dart';
import 'package:open_weather_example_flutter/screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

final cityProvider = StateProvider<String>((ref) {
  return Something.saveCity;
});

class CitySearchBox extends ConsumerStatefulWidget {
  const CitySearchBox({Key? key}) : super(key: key);
  @override
  ConsumerState<CitySearchBox> createState() => _CitySearchRowState();
}

class _CitySearchRowState extends ConsumerState<CitySearchBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25.sp,
          ),
        ),
        title: Text(
          'Find new location',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff292d38),
      body: Stack(
        children: [
          MapBoxPlaceSearchWidget(
            popOnSelect: true,
            apiKey:
                "pk.eyJ1IjoieW91dGhzcGFyayIsImEiOiJjbDJkbG1xaGEwMG14M2hxZW1oeGlnYWJkIn0.xq3o16QMad91T1nui68B3w",
            searchHint: 'Search city',
            onSelected: (place) async {
              setState(() {
                ref.read(cityProvider.state).state = place.text;
                Something.saveCity = place.text;
              });
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('saveCity', Something.saveCity);
            },
            context: context,
          ),
        ],
      ),
    );
  }
}
