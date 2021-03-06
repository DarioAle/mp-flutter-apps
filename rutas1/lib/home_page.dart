import 'package:flutter/material.dart';
import 'package:rutas1/second_page.dart';

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
          title: Text('Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
              child: Text("Hello world pantalla 1"),
            ),
            FlatButton(
              color: Colors.blue[200],
              onPressed: (){
                Navigator.of(context).pushNamed("/secondPage");
              }, 
              child: Text("Siguiente"))
            ]
          ),
        ),
      );
  }
}