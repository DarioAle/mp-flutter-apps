import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Third Page'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
              child: Text("Hello world pantalla 3"),
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