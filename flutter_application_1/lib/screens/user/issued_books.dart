import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/routes.dart';
import '../models/Main_Page.dart';
import '../models/issue_model.dart';
import 'dart:async';
import '../models/global_class.dart' as global;

Future<List<Issue>> fetchData() async {
  var url = Uri.parse(
      "https://anuveni.000webhostapp.com/api6.php?userid=" + global.globalUid);
  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    var z = (jsonResponse.map((data) => Issue.fromJson(data)));
    return z.toList();
  } else {
    throw Exception("Unexpected error occured");
  }
}

class xyz1 extends StatelessWidget {
  const xyz1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('assets/images/bg2.jpg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover),
        Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
              child: Icon(Icons.logout_rounded),
              backgroundColor: Colors.deepPurpleAccent,
            ),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text("Books Issued"),
              backgroundColor: Colors.transparent,
            ),
            body: const IssueList())
      ],
    );
  }
}

class IssueList extends StatefulWidget {
  const IssueList({super.key});

  @override
  State<IssueList> createState() => _IssueListState();
}

class _IssueListState extends State<IssueList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Issue>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: 100,
                  color: Colors.transparent,
                  child: Card(
                      color: Colors.transparent,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                                onPressed: () {
                                  String url =
                                      "https://anuveni.000webhostapp.com/renew.php" +
                                          "?bookid=" +
                                          snapshot.data![index].bookid +
                                          "&userid=" +
                                          global.globalUid;
                                  Uri uri = Uri.parse(url);
                                  final response = http.post(uri);
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                          'Selected Book:' +
                                              snapshot.data![index].bookid,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors
                                      .deepPurpleAccent, // Background color
                                ),
                                child: Text("Renew")),
                            Padding(padding: EdgeInsets.all(5)),
                            ElevatedButton(
                                onPressed: () {
                                  String url =
                                      "https://anuveni.000webhostapp.com/return.php" +
                                          "?bookid=" +
                                          snapshot.data![index].bookid +
                                          "&userid=" +
                                          global.globalUid;
                                  Uri uri = Uri.parse(url);
                                  final response = http.post(uri);
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                          'Selected Book:' +
                                              snapshot.data![index].bookid,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors
                                      .deepPurpleAccent, // Background color
                                ),
                                child: Text("Return")),
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                            "User Id : " +
                                                snapshot.data![index].userid,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 15)),
                                        Text(
                                            "Book Id : " +
                                                snapshot.data![index].bookid,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 15)),
                                      ],
                                    )))
                          ])));
            },
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
