import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  StreamSubscription<ConnectivityResult> _stream;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  // inicializar stream and observe
  @override
  void initState() {
    _initConnectivity();
    _stream = Connectivity().onConnectivityChanged.listen((event) { });
    super.initState();
  }

  @override
  void dispose(){
    _stream.cancel();
    super.dispose();
  }

  void _updateConnectionStatus(ConnectivityResult connStatus) {
    if(connStatus == ConnectivityResult.mobile) {
      _scaffoldKey.currentState..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text("Con red de dato mobiles")));

    }
    else if(connStatus == ConnectivityResult.wifi) {
      _scaffoldKey.currentState..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text("Con red de wifi")));
      
    }
    if(connStatus == ConnectivityResult.none) {
      _scaffoldKey.currentState..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text("no hay red sorry")));
      
    }

  }

  // check if you can check for connectivity
  Future _initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await Connectivity().checkConnectivity();
      print(result);
    } catch (e) {
      print(e);
    }
  }

  Future _getData() async {
    try {
      Response response = await get("https://jsonplaceholder.typicode.com/users");
      if(response.statusCode == HttpStatus.ok) {
        var result = jsonDecode(response.body);
        return result;
      }
    } catch (e) {
      print("No regresaron los datos de alguna forma.");
      return ;
    }  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: FutureBuilder(
          future: _getData(),
          builder: (context, responseProgress) {
            if(responseProgress.hasError) {
              return Center(child: Text("Error: ${responseProgress.error}"),);
            }

            if(responseProgress.hasData) {
              var data = responseProgress.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Text("${data[index]["name"]}");
                },
              );
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      );
  }
}