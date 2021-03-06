import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Libreria free to play"),
      ),
      body: GridView.count(
        // 2 columnas
        crossAxisCount: 2,
        // si no tiene childAspectRatio: (itemWidth / itemHeight) por default es 1/1 o sea cuadrado
        childAspectRatio: (3 / 4),
        children: List.generate(
          17,
          (index) => Container(
            color: Colors.green,
            margin: EdgeInsets.all(12),
          ),
        ),
      ),
    );
  }
}
