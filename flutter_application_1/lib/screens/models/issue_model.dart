import 'dart:convert';

class Issue {
  final String bookid;
  final String userid;
  final String issue;

  Issue({required this.bookid, required this.userid, required this.issue});

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue
    (
      userid: json['userid'],
      bookid: json['bookid'],
      issue: json['issue'],
    );
  }
}
