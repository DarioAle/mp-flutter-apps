import 'package:flutter/material.dart';
import 'package:rutas1/second_page.dart';

import 'home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: "/",
      routes : {
        "/" : (context) => HomePage(),
        "/secondPage" : (context) => SecondPage(),
      },
    );
  }
}