import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/user/booklist.dart';
import 'package:flutter_application_1/screens/user/issued_books.dart';
import '../models/Main_Page.dart';
import '../models/global_class.dart' as global;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              title: Text(
                "Home Screen",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
            ),
            body: Center(
              child: Column(children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Course : " + '${global.globalCourse}',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Name : " + '${global.globalName}',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "User Id : " + '${global.globalUid}',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Padding(padding: EdgeInsets.all(25)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => xyz()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent,
                        fixedSize: const Size(250, 50) // Background color
                        ),
                    child: const Text(
                      "All Book List",
                      style: TextStyle(fontSize: 20),
                    )),
                Padding(padding: EdgeInsets.all(5)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => xyz1()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent,
                        fixedSize: const Size(250, 50) // Background color
                        ),
                    child: const Text(
                      "Issued Books",
                      style: TextStyle(fontSize: 20),
                    ))
              ]),
            ))
      ],
    );
  }
}
