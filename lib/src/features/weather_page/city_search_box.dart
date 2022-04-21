import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:open_weather_example_flutter/src/constants/app_colors.dart';
import 'package:open_weather_example_flutter/widgets/user_api.dart';
import 'package:search_bar_animated/search_bar_animated.dart';

final cityProvider = StateProvider<String>((ref) {
  return 'London';
});

class CitySearchBox extends ConsumerStatefulWidget {
  const CitySearchBox({Key? key}) : super(key: key);
  @override
  ConsumerState<CitySearchBox> createState() => _CitySearchRowState();
}

class _CitySearchRowState extends ConsumerState<CitySearchBox> {
  List list = [
    "Ruse",
    "Sofia",
    "London",
    "Varna",
    "Burgas",
    "Pevek",
    "Beaufort",
    "Gold Beach",
    "New Port",
  ];

  static final _radius = 30.0.r;

  late final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  UserApi _User = UserApi();
  String value = ""; // circular radius
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              AnimatedSearchBar(
                shadow: const [
                  BoxShadow(
                      color: Color.fromARGB(41, 0, 0, 0),
                      blurRadius: 6,
                      offset: Offset(0, 1))
                ],
                backgroundColor: Colors.white,
                buttonColor: Colors.black,
                width: MediaQuery.of(context).size.width,
                submitButtonColor: Colors.black,
                textStyle: const TextStyle(color: Colors.blue),
                buttonIcon: const Icon(
                  Icons.search,
                ),
                duration: const Duration(milliseconds: 300),
                submitIcon: const Icon(Icons.send),
                animationAlignment: AnimationAlignment.left,
                onSubmit: () {
                  setState(() {
                    value = _searchController.text;
                    ref.read(cityProvider.state).state = _searchController.text;
                  });
                  //FocusScope.of(context).unfocus();
                },
                searchList: list,
                searchQueryBuilder: (query, list) => list.where((item) {
                  return item!
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase());
                }).toList(),
                textController: _searchController,
                overlaySearchListItemBuilder: (dynamic item) => Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                onItemSelected: (dynamic item) {
                  _searchController.value = _searchController.value.copyWith(
                    text: item.toString(),
                  );
                  ref.read(cityProvider.state).state = _searchController.text;
                  //FocusScope.of(context).unfocus();
                },
                overlaySearchListHeight: 100,
              ),
            ],
          ),
        ),
        // AnimSearchBar(
        //   closeSearchOnSuffixTap: true,
        //   autoFocus: true,
        //   width: 400,
        //   textController: _searchController,
        //   suffixIcon: Icon(Icons.send),
        //   onSuffixTap: () {
        //     // setState(() {
        //     //   _searchController.clear();
        //     // });
        //     FocusScope.of(context).unfocus();
        //     ref.read(cityProvider.state).state = _searchController.text;
        //   },
        // ),
        //default
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // Expanded(
        //     //   child: SizedBox(
        //     //     height: 50.h,
        //     //     child: TextField(
        //     //       controller: _searchController,
        //     //       textAlign: TextAlign.center,
        //     //       style: TextStyle(color: Colors.black, fontSize: 17.sp),
        //     //       decoration: InputDecoration(
        //     //         fillColor: Colors.white,
        //     //         filled: true,
        //     //         border: OutlineInputBorder(
        //     //           borderRadius: BorderRadius.only(
        //     //               topLeft: Radius.circular(_radius),
        //     //               bottomLeft: Radius.circular(_radius)),
        //     //         ),
        //     //       ),
        //     //       // onTap: () {
        //     //       //   showSearch(context: context, delegate: SearchUser());
        //     //       // },
        //     //       onSubmitted: (value) =>
        //     //           ref.read(cityProvider.state).state = value,
        //     //     ),
        //     //   ),
        //     // ),
        //     InkWell(
        //       child: Container(
        //         height: 50.h,
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(
        //           color: AppColors.accentColor,
        //           borderRadius: BorderRadius.only(
        //             topRight: Radius.circular(_radius),
        //             bottomRight: Radius.circular(_radius),
        //           ),
        //         ),
        //         child: Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 15.0.h),
        //           child: Text('search',
        //               style: Theme.of(context).textTheme.bodyText1),
        //         ),
        //       ),
        //       onTap: () {
        //         FocusScope.of(context).unfocus();
        //         ref.read(cityProvider.state).state = _searchController.text;
        //       },
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
//APi search from appbar
// class SearchUser extends SearchDelegate {
//   UserApi _User = UserApi();

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: Icon(Icons.close))
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back_ios),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Center(
//       child: Text('Search User'),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return FutureBuilder<List<User>>(
//         future: UserApi.getUserList(query),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           List<User>? data = snapshot.data;
//           return ListView.builder(
//               itemCount: data?.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   onTap: (() {
//                     //FocusScope.of(context).unfocus();
//                     showResults(context);
//                   }),
//                   title: Row(
//                     children: [
//                       Container(
//                         width: 60,
//                         height: 60,
//                         // decoration: BoxDecoration(
//                         //   color: Colors.deepPurpleAccent,
//                         //   borderRadius: BorderRadius.circular(10),
//                         // ),
//                         child: Center(
//                             // child: Text(
//                             //   '${data?[index].id}',
//                             //   style: TextStyle(
//                             //       fontSize: 20,
//                             //       fontWeight: FontWeight.bold,
//                             //       color: Colors.white),
//                             //   overflow: TextOverflow.clip,
//                             // ),
//                             ),
//                       ),
//                       SizedBox(width: 20),
//                       Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               '${data?[index].name}',
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black),
//                             ),
//                             SizedBox(height: 10),
//                             // Text(
//                             //   '${data?[index].name}',
//                             //   style: TextStyle(
//                             //     color: Colors.black,
//                             //     fontSize: 14,
//                             //     fontWeight: FontWeight.w400,
//                             //   ),
//                             // ),
//                           ])
//                     ],
//                   ),
//                 );
//               });
//         });
//   }
// }
