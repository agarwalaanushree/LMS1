import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/admin/admin_home.dart';
import 'package:flutter_application_1/screens/admin/books_issue.dart';
import 'package:flutter_application_1/screens/admin/books_renew.dart';
import 'package:flutter_application_1/screens/admin/books_return.dart';
import 'package:flutter_application_1/screens/models/Main_Page.dart';
import 'package:flutter_application_1/screens/admin/add_book.dart';
import 'package:flutter_application_1/screens/admin/admin_login.dart';
import 'package:flutter_application_1/screens/user/register.dart';
import 'package:flutter_application_1/screens/user/booklist.dart';
import 'package:flutter_application_1/screens/user/home.dart';
import 'package:flutter_application_1/screens/issue_book.dart';
import 'package:flutter_application_1/screens/user/issued_books.dart';
import 'package:flutter_application_1/screens/user/login_screen.dart';
import 'package:flutter_application_1/utils/routes.dart';

void main() {
  runApp(MaterialApp(
    /* themeMode: ThemeMode.system, */
    debugShowCheckedModeBanner: false,
    initialRoute: MyRoutes.loginRoute,
    routes: {
      "/": ((context) => const LoginPage()),
      /* MyRoutes.homeRoute: (context) => HomeScreen(), */
      MyRoutes.loginRoute: (context) => const LoginPage(),
      MyRoutes.issueRoute: (context) => IssueBook(),
      /* MyRoutes.loginRoute: (context) => Tables(), */
      MyRoutes.loginRoute: (context) => WelcomeScreen(),
    },
  ));
}
