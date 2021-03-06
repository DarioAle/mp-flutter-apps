import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
              child: Text("Hello world pantalla 2"),
            ),
            FlatButton(
              color: Colors.grey[200],
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text("Regresar"))
            ]
          ),
        ),
      );
  }
}