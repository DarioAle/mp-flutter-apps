import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Map<String, String> pelicula;
  ListItem({Key key, @required this.pelicula}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  "https://i.imgur.com/tpHc9cS.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfa4169D8),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Titulo"),
                      Text("Ranking"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}