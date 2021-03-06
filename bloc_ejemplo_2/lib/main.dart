import 'dart:developer';

import 'package:bloc_ejemplo_2/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CounterBloc _counterBloc;

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: BlocProvider(
          create: (context) {
            _counterBloc = CounterBloc();
            return _counterBloc;
          },
          child: Center(
            child: widgetContador()
          ),
        ),
      ),
    );
  }

  Widget widgetContador() {
    return Container(
      color: Colors.grey[300],
      child : Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _counterBloc.add(ModifyCounterEvent(isIncrement: true));
            } ,
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              if(state is NewCounterState) {
                return Text("${state.currentCount ?? 0}");
              }

              return Text("-");
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              _counterBloc.add(ModifyCounterEvent(isIncrement: false));
            } ,
          ),
        ],
      )
    );
  }
}