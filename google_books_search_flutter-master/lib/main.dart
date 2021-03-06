import 'package:flutter/material.dart';
import 'package:google_books_api/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google books API request App',
      theme: ThemeData(
        primaryColor: Colors.grey[800],
        accentColor: Colors.grey[400],
        cursorColor: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}
