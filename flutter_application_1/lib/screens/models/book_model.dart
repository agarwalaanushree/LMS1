import 'dart:convert';

class Book {
  final String bookid;
  final String author;
  final String name;

  Book({required this.bookid, required this.author, required this.name});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      author: json['author'],
      bookid: json['bookid'],
      name: json['name'],
    );
  }
}
