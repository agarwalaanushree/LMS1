import 'dart:convert';

class Book {
  final String bookid;
  final String bname;
  final String author;
  final String publi;
  final String dept;
  final String edi;
  final String sts;

  Book({
    required this.bookid,
    required this.bname,
    required this.author,
    required this.publi,
    required this.dept,
    required this.edi,
    required this.sts,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookid: json['bookid'],
      bname: json['Book_name'],
      author: json['Author'],
      publi: json['Publication'],
      dept: json['Department'],
      edi: json['Edition'],
      sts: json['Status'],
    );
  }
}
