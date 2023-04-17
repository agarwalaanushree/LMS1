import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/models/Main_Page.dart';
import 'package:flutter_application_1/screens/user/issued_books.dart';
import 'package:flutter_application_1/screens/user/login_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/routes.dart';
import 'dart:async';
import '../models/global_class.dart' as global;
import '../models/user_model.dart';

class data {
  String dept;
  data({required this.dept});

  String getDept() {
    return this.dept;
  }
}

Future<List<User>> fetchData() async {
  var url = Uri.parse("https://anuveni.000webhostapp.com/user.php");
  final response = await http.get(url);
  print(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    var z = (jsonResponse.map((data) => User.fromJson(data)));
    return z.toList();
  } else {
    throw Exception("Unexpected error occured");
  }
}

class user extends StatelessWidget {
  const user({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
              title: const Text("Student Details"),
              backgroundColor: Colors.transparent,
            ),
            body: BookList())
      ],
    );
  }
}

class BookList extends StatefulWidget {
  const BookList({
    super.key,
  });

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
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
                            /* ElevatedButton(
                                onPressed: () {
                                  String url =
                                      "https://anuveni.000webhostapp.com/issue.php" +
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
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors
                                      .deepPurpleAccent, // Background color
                                ),
                                child: Text("Issue")),
                            Padding(padding: EdgeInsets.all(5)), */
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
                                            "Username : " +
                                                snapshot.data![index].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 15)),
                                        Text(
                                            "Course : " +
                                                snapshot.data![index].course,
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
