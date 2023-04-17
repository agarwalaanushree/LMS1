import 'dart:convert';

class Record {
  final String bookid;
  final String bname;
  final String author;

  Record({
    required this.bookid,
    required this.author,
    required this.bname,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      bookid: json['bookid'],
      author: json['author'],
      bname: json['name'],
    );
  }
}
