import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List App',
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
  // json ejemplo
  var _data = [
    {
      "nombre": "Juan Perez",
      "gamer": true,
      "edad": 799,
      "foto":
          "https://richardgarcia.net/wp-content/uploads/2017/01/hombre-exitoso-png.png",
    },
    {
      "nombre": "Chuy",
      "gamer": false,
      "edad": 9,
      "foto":
          "https://1.bp.blogspot.com/-xQjYgbOWBVo/V_mkuxzIJKI/AAAAAAAABOE/WiqjQQV15cAuwbXmtem26vywz4mTKlw8ACLcB/s1600/hombre.png",
    },
    {
      "nombre": "Karen",
      "gamer": false,
      "edad": 79,
      "foto":
          "https://toppng.com/uploads/preview/mujeres-en-png-mujer-feliz-11563001923iicassndn8.png",
    },
    {
      "nombre": "Mohammed",
      "gamer": false,
      "edad": 7,
      "foto":
          "https://1.bp.blogspot.com/-5ydU5haAbEY/V_mkYhkzOVI/AAAAAAAABOs/cVcd0cPB45AanuRdHIYoA7uYD5Wh1IkaACEw/s1600/banner2-man.png",
    },
    {
      "nombre": "Maria",
      "gamer": false,
      "edad": 99,
      "foto":
          "https://www.pngjoy.com/pngm/103/2144636_sad-girl-triste-mujer-png-download.png",
    },
    {
      "nombre": "Joanne",
      "gamer": true,
      "edad": 19,
      "foto":
          "https://acoal-assessors.com/wp-content/uploads/2018/06/mujer_positiva_crecemujer.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          return _listItem(_data[index]);
        },
      ),
    );
  }

  Widget _listItem(Map<String, dynamic> usuario) {
    bool isGamer = usuario["gamer"];
    print(isGamer);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(usuario["foto"]),
        backgroundColor: Colors.transparent,
      ),
      title: Text("${usuario["nombre"]}"),
      subtitle: Text("Edad: ${usuario["edad"]}"),
      trailing: IconButton(
        icon: Icon(Icons.games),
        color: isGamer ? Colors.red : Colors.black45,
        onPressed: () {
          setState(() {
            isGamer = !isGamer;
            usuario["gamer"] = isGamer;
          });
        },
      ),
    );
  }
}