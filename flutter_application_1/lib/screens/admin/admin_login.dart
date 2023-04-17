import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/admin/admin_home.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'admin_global.dart' as global1;

class data {
  String? uid;
  String? password;
  String? email;
  String? number;

  data({this.uid, this.password, this.email, this.number});

  data.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    password = json['password'];
    email = json['email'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['password'] = this.password;
    data['email'] = this.email;
    data['number'] = this.number;
    return data;
  }
}

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
      String url = "https://anuveni.000webhostapp.com/admin.php?name=" + _name;
      print(url);
      Uri uri = Uri.parse(url);
      final response = await http.get(uri);
      print(response.body);
      data obj = data.fromJson(jsonDecode(response.body));
      if (obj.uid == _name || obj.password == _pass) {
        await Future.delayed(const Duration(seconds: 1));
        global1.globalemail = obj.email.toString();
        global1.globalid = obj.uid.toString();
        global1.globalno = obj.number.toString();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdminHome(),
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
                "assets/images/bg6.jpg",
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
                          labelText: "Admin Id",
                          prefixIcon: Icon(Icons.person),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Admin Id",
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
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
