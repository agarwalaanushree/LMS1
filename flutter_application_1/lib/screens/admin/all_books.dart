import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/models/Main_Page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'admin_global.dart' as global1;
import '../models/global_class.dart' as global;
import '../models/allbooks_model.dart';
import 'admin_login.dart';

Future<List<Record>> fetchData() async {
  var url = Uri.parse("https://anuveni.000webhostapp.com/books.php");
  final response = await http.get(url);
  print(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    var z = (jsonResponse.map((data) => Record.fromJson(data)));
    print(z.toList());
    return z.toList();
  } else {
    throw Exception("Unexpected error occured");
  }
}

class xyz3 extends StatelessWidget {
  const xyz3({super.key});

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
            title: const Text("Books"),
            backgroundColor: Colors.transparent,
          ),
          body: BookList())
    ]);
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
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightBlue, // Background color
                                ),
                                child: Text("Book Id : " +
                                    snapshot.data![index].bookid)),
                            Padding(padding: EdgeInsets.all(5)),
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                            "Book Name : " +
                                                snapshot.data![index].bname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                        Text(
                                            "Author : " +
                                                snapshot.data![index].author,
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
