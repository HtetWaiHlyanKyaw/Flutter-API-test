import 'package:api_test/models/user_dob.dart';

class Users {
  final String email;
  final String firstName;
  final UserDob dob;
  Users({required this.email, required this.firstName, required this.dob});

  factory Users.fromMap(Map<String, dynamic> e) {
    final age = e['dob']['age'];
    final dob = UserDob(date: DateTime.parse(e['dob']['date']), age: age);
    return Users(email: e["email"], firstName: e["name"]["first"], dob: dob);
  }
}
