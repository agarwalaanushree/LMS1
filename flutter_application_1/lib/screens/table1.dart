import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class books {
  List<Data>? data;

  books({this.data});

  books.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;

  Data({this.id, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  xyz(BuildContext context) async {
    String url = "https://mocki.io/v1/df609c84-53be-42e7-bccb-42bb7714b8c4";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    books obj = books.fromJson(jsonDecode(response.body));
    var x;
    x = obj.data;
    return x;
    /* children:
    <Widget>[
      for (var i = 0; i < x.length; i++)
        Box1(
          name: x.name[i],
          id: x.id[i],
        ),
    ]; */
  }

  @override
  Widget build(BuildContext context) {
    var z = xyz(context);
    print(z);
    return Scaffold(
        appBar: AppBar(title: Text("Page2")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[xyz(context)],
        ));
  }
}

class Box1 extends StatelessWidget {
  Box1({required this.name, required this.id});
  final String name;
  final String id;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              ElevatedButton(onPressed: () {}, child: Text("$id")),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )))
            ])));
  }
}
