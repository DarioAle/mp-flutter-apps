import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/front_bloc.dart';

class Front extends StatefulWidget {
  Front({Key key}) : super(key: key);

  @override
  _FrontState createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Guess the Word"),
      ),
      body: BlocProvider(
        create: (context) => FrontBloc(),
        child: BlocConsumer<FrontBloc, FrontState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is JuegoIniciadoState) {
              return buildContainerInitial(state, context);
            } else if (state is JuegoEndState) {
              return buildContainerGameEnded(state, context);
            } else
              return buildWelcomeScreen(context);
          },
        ),
      ),
    );
  }

  Container buildWelcomeScreen(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text("Get ready to"),
                  SizedBox(height: 20.0),
                  Text(
                    "Guess the word!",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, -0.5),
              child: Container(
                width: 200,
                child: MaterialButton(
                  child: Text(
                    "PLAY",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    BlocProvider.of<FrontBloc>(context).add(StartEvent());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainerGameEnded(JuegoEndState state, BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.titulo),
                  SizedBox(height: 25.0),
                  Text(
                    state.contador.toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 150),
              child: MaterialButton(
                child: Text(
                  "PLAY AGAIN",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.green,
                onPressed: () {
                  BlocProvider.of<FrontBloc>(context).add(StartEvent());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildContainerInitial(
      JuegoIniciadoState state, BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0,-0.5),
              child: Container(
                height: 200,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 75),
                  child: Column(
                    children: [
                      Text(state.titulo),
                      SizedBox(height: 15.0),
                      Text(
                        state.palabra,
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: Text(
                  state.contador.toString(),
                  style : TextStyle(
                    fontSize: 50
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                      child: Text("SKIP"),
                      onPressed: () {
                        BlocProvider.of<FrontBloc>(context).add(SkipEvent());
                      }),
                  MaterialButton(
                      child: Text(
                        "GOT IT",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        BlocProvider.of<FrontBloc>(context).add(GotEvent());
                      }),
                  MaterialButton(
                      child: Text("END GAME"),
                      onPressed: () {
                        BlocProvider.of<FrontBloc>(context).add(EndEvent());
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
