

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi segunda app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  bool toggleUp = false;
  bool toggleDown = false;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info del ITESO'),
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network("https://pbs.twimg.com/media/DburBCaVQAAM_2g.jpg"),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Row(
                children: [
                  // textos
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ITESO, Universidad Jesuita de Guadalajara",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("San Pedro Tlaquepaque"),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          color: toggleUp ? Colors.blue : Colors.grey,
                        ),
                        onPressed: () {
                          toggleUp = !toggleUp;
                          counter++;
                          setState(() {});
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.thumb_down,
                          color: toggleDown ? Colors.red[600] : Colors.grey,
                        ),
                        onPressed: () {
                          counter--;
                          counter = counter < 0 ? 0 : counter;
                         toggleDown = !toggleDown;
                         setState(() {});
                        },
                      ),
                    ],
                  ),
                  Text("$counter"),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //botones
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                          icon: Icon(
                          Icons.mail,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("Escribenos a inscripciones@iteso.mx"),
                            ),
                          );
                        },
                      ),
                      Text("Correo"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.call,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(content: Text("LLamanos al 3310830017"),
                            ),
                          );
                        },
                      ),
                      Text("Llamar"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.directions,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(content: Text("Visitanos en Peri Sur"),
                            ),
                          );
                        },
                      ),
                      Text("Ruta"),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                  "Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas"),
            ),
            Padding(
              padding: const EdgeInsets.only(left:135),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child : IconButton(
                      icon: Icon (
                        Icons.message,
                        size: 64,
                        ),
                      onPressed: () => _showEventDialog(context, counter)
                  
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showEventDialog(BuildContext context, int c) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Paridad de los likes"),
        content: Text("El numero de likes es"),
        actions:[
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          )
        ]);
    });
}