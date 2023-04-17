import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  print("Main Method");
  String url = "https://mocki.io/v1/11c1bc08-6f74-4521-aae4-9692279530cd";
  final response = await http.get(url as Uri);
  print(response.body);
  data obj = data.fromJson(jsonDecode(response.body));
  print(obj.id);
}

class data {
  String? id;
  String? pass;

  data({this.id, this.pass});

  data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pass = json['pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pass'] = this.pass;
    return data;
  }
}
