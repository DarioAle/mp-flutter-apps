import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITESO App',
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
  bool isUpPressed = false;
  bool isDownPressed = false;
  int counter = 9999;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          Image.network("https://pbs.twimg.com/media/DburBCaVQAAM_2g.jpg"),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('El ITESO, Universidad Jesuita de Guadalajara',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                    Text(
                      'San Pedro Tlaquepaque, Jal.',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          color: isUpPressed ? Colors.blue : Colors.grey,
                        ),
                        onPressed: () {
                          isUpPressed = !isUpPressed;
                          print("Up Presionado: $isUpPressed");
                          counter++;
                          setState(() {});
                        }),
                    IconButton(
                      icon: Icon(
                        Icons.thumb_down,
                        color: isDownPressed ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        isDownPressed = !isDownPressed;
                        print("Down Presionado: $isDownPressed");
                        counter--;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("$counter", style: TextStyle(fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //3 botones
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.mail, size: 54, color: Colors.grey[800]),
                      onPressed: () {
                        _scaffoldKey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("admision@iteso.mx"),
                            ),
                          );
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon:
                          Icon(Icons.phone, size: 54, color: Colors.grey[800]),
                      onPressed: () {
                        _scaffoldKey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("33 3669 3434"),
                            ),
                          );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.directions,
                          size: 54, color: Colors.grey[800]),
                      onPressed: () {
                        _scaffoldKey.currentState
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Anillo Perif. Sur Manuel Gómez Morín 8585, Santa María Tequepexpan, 45604 San Pedro Tlaquepaque, Jal. "),
                            ),
                          );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  Text("Correo",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]))
                ]),
                Column(children: [
                  Text("Llamada",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]))
                ]),
                Column(children: [
                  Text("Ruta",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]))
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 50.0,
            ),
            child: Text(
                "El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas."),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.0,
              vertical: 0.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon:
                          Icon(Icons.check, size: 54, color: Colors.grey[800]),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => AlertDialog(),
                            fullscreenDialog: false,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6200EE),
        title: Text('Revision del contador de likes'),
      ),
      body: Center(
        child: Text(
            1 % 2 == 1 ? "con la fecha y hora" : "El contador de likes es par",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}