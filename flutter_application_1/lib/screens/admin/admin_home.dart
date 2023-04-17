import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/admin/add_book.dart';
import 'package:flutter_application_1/screens/admin/admin_login.dart';
import 'package:flutter_application_1/screens/admin/all_users.dart';
import 'package:flutter_application_1/screens/admin/books_issue.dart';
import 'package:flutter_application_1/screens/admin/books_renew.dart';
import 'package:flutter_application_1/screens/admin/books_return.dart';
import 'package:flutter_application_1/screens/models/Main_Page.dart';
import 'admin_global.dart' as global1;
import 'all_books.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
            title: Text("Admin Home"),
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Admin Id : " + '${global1.globalid}',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                "Email Id : " + '${global1.globalemail}',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                "Phone Number : " + '${global1.globalno}',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => user()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      fixedSize: const Size(250, 50) // Background color
                      ),
                  child: const Text(
                    "Students",
                    style: TextStyle(fontSize: 20),
                  )),
              Padding(padding: EdgeInsets.all(5)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => xyz3()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      fixedSize: const Size(250, 50) // Background color
                      ),
                  child: const Text(
                    "All Books List",
                    style: TextStyle(fontSize: 20),
                  )),
              Padding(padding: EdgeInsets.all(5)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddBook()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      fixedSize: const Size(250, 50) // Background color
                      ),
                  child: const Text(
                    "Add Book",
                    style: TextStyle(fontSize: 20),
                  )),
              Padding(padding: EdgeInsets.all(5)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => xyz2()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      fixedSize: const Size(250, 50) // Background color
                      ),
                  child: const Text("Issue Requests",
                      style: TextStyle(fontSize: 20))),
              Padding(padding: EdgeInsets.all(5)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Return()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      fixedSize: const Size(250, 50) // Background color
                      ),
                  child: const Text("Return Requests",
                      style: TextStyle(fontSize: 20))),
              Padding(padding: EdgeInsets.all(5)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Renew()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      fixedSize: const Size(250, 50) // Background color
                      ),
                  child: const Text("Renewal Requests",
                      style: TextStyle(fontSize: 20))),
            ]),
          ))
    ]);
  }
}
