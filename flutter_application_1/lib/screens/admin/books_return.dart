import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/models/Main_Page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/return_model.dart';
import 'dart:async';
import 'admin_global.dart' as global1;
import '../models/global_class.dart' as global;
import 'admin_login.dart';

Future<List<Record>> fetchData() async {
  var url = Uri.parse("https://anuveni.000webhostapp.com/return_books.php");
  final response = await http.get(url);
  print(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    var z = (jsonResponse.map((data) => Record.fromJson(data)));
    return z.toList();
  } else {
    throw Exception("Unexpected error occured");
  }
}

class Return extends StatelessWidget {
  const Return({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset('assets/images/bg8.jpg',
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
            backgroundColor: Colors.lightBlue,
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text("Return Requests"),
            backgroundColor: Colors.transparent,
          ),
          body: ReturnList())
    ]);
  }
}

class ReturnList extends StatefulWidget {
  const ReturnList({
    super.key,
  });

  @override
  State<ReturnList> createState() => _ReturnListState();
}

class _ReturnListState extends State<ReturnList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Record>>(
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
                                      "https://anuveni.000webhostapp.com/accept_return.php" +
                                          "?bookid=" +
                                          snapshot.data![index].bookid +
                                          "&userid=" +
                                          snapshot.data![index].userid +
                                          "&dues=" +
                                          snapshot.data![index].dues;
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
                                  primary: Colors.lightBlue, // Background color
                                ),
                                child: Text("Accept")),
                            Padding(padding: EdgeInsets.all(5)),
                            ElevatedButton(
                                onPressed: () {
                                  String url =
                                      "https://anuveni.000webhostapp.com/reject_return.php" +
                                          "?bookid=" +
                                          snapshot.data![index].bookid +
                                          "&userid=" +
                                          snapshot.data![index].userid;
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
                                  primary: Colors.lightBlue, // Background color
                                ),
                                child: Text("Reject")),
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                            "Book Id : " +
                                                snapshot.data![index].bookid,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            )),
                                        Text(
                                            "User Id : " +
                                                snapshot.data![index].userid,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
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
