import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String? name;

  const User({
    this.name,
  });

  static User fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
      );
}

class UserApi {
  static Future<List<User>> getUserList(String query) async {
    final url = Uri.parse(
        'https://raw.githubusercontent.com/dr5hn/countries-states-cities-database/master/cities.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => User.fromJson(json)).where((user) {
        final nameLower = user.name?.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower!.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
