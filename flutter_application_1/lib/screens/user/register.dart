import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/user/login_screen.dart';
import 'package:http/http.dart' as http;

import '../models/Main_Page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _uid = TextEditingController();
  final _name = TextEditingController();
  final _branch = TextEditingController();
  final _course = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _cpass = TextEditingController();

  bool visible = false;

  Future webCall() async {
    setState(() {
      visible = true;
    });

    String uid = _uid.text;
    String name = _name.text;
    String branch = _branch.text;
    String course = _course.text;
    String phone = _phone.text;
    String email = _email.text;
    String pass = _pass.text;
    String cpass = _cpass.text;

    String url = ("https://anuveni.000webhostapp.com/register.php" +
        "?" +
        "userid=" +
        uid +
        "&name=" +
        name +
        "&branch=" +
        branch +
        "&Course=" +
        course +
        "&phone=" +
        phone +
        "&email=" +
        email +
        "&pass=" +
        pass +
        "&cpass=" +
        cpass);
    Uri uri = Uri.parse(url);
    final response = await http.post(uri);

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }
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
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg2.jpg'), fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            //1st container

            Container(
              padding: EdgeInsets.only(
                left: 75,
                top: 5,
              ),
            ),

            SizedBox(
              height: 90,
            ),

            //2nd contianer

            Container(
              padding: EdgeInsets.only(
                left: 100,
              ),
              child: Text(
                "Register Now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),

            //3rd container

            Container(
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: TextField(
                controller: _uid,
                decoration: InputDecoration(
                    labelText: "User_ID",
                    prefixIcon: Icon(Icons.person),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "User_id",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),

            //4th container
            Container(
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                    labelText: "Full Username",
                    prefixIcon: Icon(Icons.person),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Full Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: TextField(
                controller: _branch,
                decoration: InputDecoration(
                    labelText: "Branch",
                    prefixIcon: Icon(Icons.book),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Branch",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: TextField(
                controller: _course,
                decoration: InputDecoration(
                    labelText: "Course",
                    prefixIcon: Icon(Icons.book),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Course",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: TextField(
                controller: _phone,
                decoration: InputDecoration(
                    labelText: "Phone Number",
                    prefixIcon: Icon(Icons.call),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Phone Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    labelText: "Email Adress",
                    prefixIcon: Icon(Icons.email),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Email Adress",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
//5th container

            Container(
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: TextField(
                controller: _pass,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.vpn_key_rounded),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),

//6th continer

            Container(
              padding: EdgeInsets.only(left: 30, top: 30, right: 30),
              child: TextField(
                controller: _cpass,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "confirm Password",
                    prefixIcon: Icon(Icons.vpn_key_rounded),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Confirm Password",
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
                  primary: Colors.deepPurpleAccent, // Background color
                ),
                child: Text("Register"),
              ),
            ),
            Visibility(
                visible: visible,
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: CircularProgressIndicator(),
                )),

            //8th contain
            Container(
              padding: EdgeInsets.only(
                left: 75,
                top: 10,
              ),
              child: Row(
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text("Login")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
