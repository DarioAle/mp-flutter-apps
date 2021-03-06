import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial());
  int _counter = 0;

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if(event is ModifyCounterEvent){
     if(event.isIncrement) {
       _counter++;
     }
     else {
       _counter--;
     }

     yield NewCounterState(currentCount: _counter);
    }
  }
}
