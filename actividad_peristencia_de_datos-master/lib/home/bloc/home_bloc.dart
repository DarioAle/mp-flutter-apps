import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  //TODO: referencia a la box
  Box configBox = Hive.box("configs");

  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    // TODO: completar para cargar datos guardados y guardar datos nuevos
    if(event is SaveConfigsEvent) {
      await configBox.put("configs", event.configs);
      yield DoneState();
    } else if(event is LoadConfigsEvent) {
      final configData = await configBox.get("configs", defaultValue: {
              "switch": false,
              "checkbox": false,
              "dropdown": "uno",
              "slider": 1.0
            });
      yield LoadedConfigsState(configs: configData);
    }
  }
}
