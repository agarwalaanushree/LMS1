import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class Tables extends StatefulWidget {
  @override
  _TablesState createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  xyz(BuildContext context) async {
    var name = {"A", "B", "C"};
    var desi = {"1", "2", "3"};
    String url = "https://mocki.io/v1/df609c84-53be-42e7-bccb-42bb7714b8c4";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    /* print(response.body); */
    books obj = books.fromJson(jsonDecode(response.body));
    var x;
    x = obj.data;
    return x;
  }

  @override
  Widget build(BuildContext context) {
    var z = xyz(context);
    print(z);

    var name = {"A", "B", "C"};
    var desi = {"1", "2", "3"};
    return Scaffold(
      appBar: AppBar(
        title: const Text("Table Widget"),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Table",
                textScaleFactor: 2,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(
                    children: [
                      Text(
                        "S.No.",
                        textScaleFactor: 1.5,
                      ),
                      Text(
                        "Name.",
                        textScaleFactor: 1.5,
                      ),
                      Text(
                        "Designation.",
                        textScaleFactor: 1.5,
                      ),
                    ],
                  ),
                  for (var i = 0; i < name.length; i++)
                    TableRow(children: [
                      Text(
                        i.toString(),
                        textScaleFactor: 1.5,
                      ),
                      Text(
                        name.elementAt(i),
                        textScaleFactor: 1.5,
                      ),
                      Text(
                        desi.elementAt(i),
                        textScaleFactor: 1.5,
                      )
                    ])
                  /* for (var i = 0; i < z.length; i++)
                    TableRow(children: [
                      Text(
                        i.toString(),
                        textScaleFactor: 1.5,
                      ),
                      Text(
                        z.id[i],
                        textScaleFactor: 1.5,
                      ),
                      Text(
                        z.name[i],
                        textScaleFactor: 1.5,
                      )
                    ]), */
                ],
              )),
        ],
      ),
    );
  }
}
