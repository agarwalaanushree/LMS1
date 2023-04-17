import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/models/Main_Page.dart';
import 'package:http/http.dart' as http;

import 'admin_login.dart';

class AddBook extends StatefulWidget {
  const AddBook({Key? key}) : super(key: key);

  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final _bname = TextEditingController();
  final _author = TextEditingController();
  final _publi = TextEditingController();
  final _dept = TextEditingController();
  final _edi = TextEditingController();
  final _sts = TextEditingController();

  Future webCall() async {
    String bname = _bname.text;
    String author = _author.text;
    String publi = _publi.text;
    String dept = _dept.text;
    String edi = _edi.text;
    String sts = _sts.text;

    String url = ("https://anuveni.000webhostapp.com/add_book.php" +
        "?bname=" +
        bname +
        "&author=" +
        author +
        "&publi=" +
        publi +
        "&dept=" +
        dept +
        "&edi=" +
        edi +
        "&sts=" +
        sts);
    Uri uri = Uri.parse(url);
    final response = await http.post(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text("Add Book"),
        backgroundColor: Colors.lightBlue,
      ),
      /* backgroundColor: Colors.transparent, */
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg8.jpg'),
              scale: 1.0,
              fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            //1st container

            Container(
              padding: EdgeInsets.only(
                left: 75,
                top: 1,
              ),
            ),

            SizedBox(
              height: 70,
            ),

            //2nd contianer

            Container(
              padding: EdgeInsets.only(
                left: 120,
              ),
              child: Text(
                "Add Book",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),

            //3rd container

            Container(
              padding: EdgeInsets.only(left: 30, top: 20, right: 30),
              child: TextField(
                controller: _bname,
                decoration: InputDecoration(
                    labelText: "Book Title",
                    prefixIcon: Icon(Icons.book),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Book Title",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),

            //4th container
            Container(
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: TextField(
                controller: _author,
                decoration: InputDecoration(
                    labelText: "Author",
                    prefixIcon: Icon(Icons.person),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Author",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: TextField(
                controller: _publi,
                decoration: InputDecoration(
                    labelText: "Publication",
                    prefixIcon: Icon(Icons.book),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Publication",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: TextField(
                controller: _dept,
                decoration: InputDecoration(
                    labelText: "Department",
                    prefixIcon: Icon(Icons.book),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Department",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: TextField(
                controller: _edi,
                decoration: InputDecoration(
                    labelText: "Edition",
                    prefixIcon: Icon(Icons.book),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Edition",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: TextField(
                controller: _sts,
                decoration: InputDecoration(
                    labelText: "Availability",
                    prefixIcon: Icon(Icons.numbers),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Availability",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),

            //7th container

            Container(
              height: 60,
              width: 50,
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 20,
              ),
              child: ElevatedButton(
                onPressed: webCall,
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue, // Background color
                ),
                child: Text("Add Book"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
