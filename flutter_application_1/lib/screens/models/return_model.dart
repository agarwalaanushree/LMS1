import 'dart:convert';

class Record {
  final String bookid;
  final String userid;
  final String dues;

  Record({required this.bookid, required this.userid, required this.dues});

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      bookid: json['bookid'],
      userid: json['userid'],
      dues: json['dues'],
    );
  }
}
