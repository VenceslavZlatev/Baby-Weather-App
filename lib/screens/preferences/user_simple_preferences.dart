// import 'package:shared_preferences/shared_preferences.dart';

// class UserSimplePreferences {
//   static SharedPreferences? _preferences;
//   static const _keyUsername = 'username';
//   static const _keyGender = 'gender1';
//   static const _keyBirthday = 'birthday1';
//   static const _selectC = 'selectC';
//   static const _selectF = 'selectF';

//   static Future init() async =>
//       _preferences = await SharedPreferences.getInstance();

//   static Future setUsername(String username) async =>
//       await _preferences?.setString(_keyUsername, username);

//   static Future setGender(int genderset) async =>
//       await _preferences?.setInt(_keyGender, genderset);

//   static Future setBirthday(DateTime dateOfBirth) async {
//     final birthday = dateOfBirth.toIso8601String();

//     return await _preferences?.setString(_keyBirthday, birthday);
//   }

//   static Future setSelectC(bool selectC) async =>
//       await _preferences?.setBool(_selectC, selectC);

//   static Future setSelectF(bool selectF) async =>
//       await _preferences?.setBool(_selectF, selectF);

//   static bool? getSelectC() => _preferences!.getBool(_selectC);
//   static bool? getSelectF() => _preferences!.getBool(_selectF);
//   static String? getUsername() => _preferences!.getString(_keyUsername);
//   static int? getGender() => _preferences!.getInt(_keyGender);
//   static DateTime? getBirthday() {
//     final birthday = _preferences?.getString(_keyBirthday);
//     return birthday == null ? null : DateTime.tryParse(birthday);
//   }
// }
