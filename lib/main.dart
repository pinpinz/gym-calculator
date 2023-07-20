import 'package:bmi_calculator_app/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'Screens/input_page.dart';

void main() => runApp(MyApp());

var ip = 'localhost/jerry/';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color.fromARGB(255, 124, 144, 243),
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 23, 39),
      ),
      home: LoginPage(),
    );
  }
}
