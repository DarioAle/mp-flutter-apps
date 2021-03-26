import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_login/home/pantalla_uno.dart';
import 'package:google_login/models/articles.dart';

class PantallaDos extends StatelessWidget {
  const PantallaDos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getNoticias(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Algo salio mal", style: TextStyle(fontSize: 50)),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ItemNoticia(
                    noticia: snapshot.data[index],
                  );
                });
          } else {
            return Center(
              child: Text("Cargando noticias", style: TextStyle(fontSize: 50)),
            );
          }
        },
      ),
    );
  }
}

// recurpera la lista de docs en firestore
// map a objet de dart
// cada elemento agregarlo a una lista.
Future<List<Articles>> getNoticias() async {
  var noticias = await FirebaseFirestore.instance.collection('noticias').get();
  List<Articles> la = noticias.docs
      .map((element) => Articles(
          author: element['author'],
          title: element['tittle'],
          urlToImage: element['image'],
          description: element['description'],
          // source: element['source'],
          publishedAt: element['publishedAT'].toDate()))
      .toList();

  return la;
}
