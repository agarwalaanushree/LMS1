import 'dart:convert';

class Record {
  final String bookid;
  final String userid;

  Record({
    required this.bookid,
    required this.userid,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      bookid: json['bookid'],
      userid: json['userid'],
    );
  }
}
