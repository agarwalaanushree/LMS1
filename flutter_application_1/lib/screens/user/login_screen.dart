import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/user/home.dart';
import 'package:flutter_application_1/screens/user/register.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import '../../utils/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/global_class.dart' as global;

class data {
  String? uid;
  String? password;
  String? course;
  String? uname;

  data({this.uid, this.password, this.course, this.uname});

  data.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    password = json['password'];
    course = json['course'];
    uname = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['password'] = this.password;
    data['course'] = this.course;
    data['uname'] = this.uname;
    return data;
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameTEC = TextEditingController();
  TextEditingController _passTEC = TextEditingController();

  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      var _name = _nameTEC.text;
      var _pass = _passTEC.text;
      print("Name: " + _name);
      print("Password: " + _pass);
      print("U tap here");
      String url = "https://anuveni.000webhostapp.com/api1.php?name=" + _name;
      print(url);
      Uri uri = Uri.parse(url);
      final response = await http.get(uri);
      print(response.body);
      data obj = data.fromJson(jsonDecode(response.body));
      /*  List jsonResponse = json.decode(response.body);
     var z = (jsonResponse.map((data) => data.fromJson(data))); */
      if (obj.uid == _name || obj.password == _pass) {
        await Future.delayed(const Duration(seconds: 1));
        global.globalCourse = obj.course.toString();
        global.globalName = obj.uname.toString();
        global.globalUid = obj.uid.toString();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        Fluttertoast.showToast(
            msg: "Wrong Passwrod",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }

      /*  Navigator.push(context,MaterialPageRoute(builder: (BuildContext (context) {
        return HomeScreen();
      }))); */
      setState(() {
        changeButton = false;
      });
    }
  }

  get style => null;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/bg5.jpg",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text("Welcome",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 30, right: 30),
                    child: TextField(
                      controller: _nameTEC,
                      decoration: InputDecoration(
                          labelText: "Enter Username",
                          prefixIcon: Icon(Icons.person),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 30, right: 30),
                    child: TextField(
                      controller: _passTEC,
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
                  const SizedBox(
                    height: 40.0,
                  ),
                  Material(
                    // ignore: deprecated_member_use
                    color: context.theme.buttonColor,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,

                        //shape:changeButton?BoxShape.circle:BoxShape.rectangle,

                        child: changeButton
                            ? const Icon(Icons.done, color: Colors.black)
                            : const Text("Login",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text("Register?"))
                    ],
                  )
                  /* ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.black),
                      )), */
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
