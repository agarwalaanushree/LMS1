import 'dart:convert';

class User {
  final String name;
  final String userid;
  final String course;

  User({required this.name, required this.userid, required this.course});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userid: json['userid'],
      name: json['name'],
      course: json['course'],
    );
  }
}
