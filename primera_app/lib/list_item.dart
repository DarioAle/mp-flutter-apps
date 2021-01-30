import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        child: Stack(children: [
          Image.network("https://i.imgur.com/0NTTbFn.jpg", 
          fit: BoxFit.fill
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff4169d8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children : [
                  Text("Titulo"),
                  Text("Ranking"),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}