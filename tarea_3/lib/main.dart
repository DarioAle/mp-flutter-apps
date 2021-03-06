import 'package:flutter/material.dart';
import 'package:tarea_3/front.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess the word',
      theme: ThemeData(primaryColor: Colors.green[200]),
      home: Front()
    );
  }
}