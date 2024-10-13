import 'dart:convert';
// import 'package:api_test/models/user_dob.dart';
import 'package:api_test/models/users.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<Users>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    final users = results.map((e) {
      // final age = e['dob']['age'];
      // final dob = UserDob(date: DateTime.parse(e['dob']['date']), age: age);
      // return Users(email: e["email"], firstName: e["name"]["first"], dob: dob);
      return Users.fromMap(e);
    }).toList();
    return users;
  }
}
