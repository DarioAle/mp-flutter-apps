import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'front_event.dart';
part 'front_state.dart';

class FrontBloc extends Bloc<FrontEvent, FrontState> {
  FrontBloc() : super(FrontInitial());
  List<String> list1 = [
    "Perro",
    "Gato",
    "the",
    "computer",
    "wouldn't",
    "start",
    "she",
    "banged",
    "on",
    "the",
    "side",
    "and",
    "tried",
    "again",
    "nothing",
    "she",
    "lifted",
    "it",
    "up",
    "and",
    "dropped",
    "it",
    "to",
    "the",
    "table",
    "still",
    "nothing",
    "she",
    "banged",
    "her",
    "closed",
    "fist",
    "against",
    "the",
    "top",
    "it",
    "was",
    "at",
    "this",
    "moment",
    "she",
    "saw",
    "the",
    "irony",
    "of",
    "trying",
    "to",
    "fix",
    "the",
    "machine",
    "with",
    "violence"
  ];
  List<String> list2 = [
    "Perro",
    "Gato",
    "the",
    "computer",
    "wouldn't",
    "start",
    "she",
    "banged",
    "on",
    "the",
    "side",
    "and",
    "tried",
    "again",
    "nothing",
    "she",
    "lifted",
    "it",
    "up",
    "and",
    "dropped",
    "it",
    "to",
    "the",
    "table",
    "still",
    "nothing",
    "she",
    "banged",
    "her",
    "closed",
    "fist",
    "against",
    "the",
    "top",
    "it",
    "was",
    "at",
    "this",
    "moment",
    "she",
    "saw",
    "the",
    "irony",
    "of",
    "trying",
    "to",
    "fix",
    "the",
    "machine",
    "with",
    "violence"
  ];

  int listSize = 0;
  int index = 0;
  int count = 0;

  @override
  Stream<FrontState> mapEventToState(
    FrontEvent event,
  ) async* {
    if (event is StartEvent) {
      list2.shuffle();
      listSize = list1.length;
      count = 0;
      index = 0;
      yield JuegoIniciadoState(
          contador: count, palabra: list1[index], titulo: "The word is...");
    } else if (event is SkipEvent) {
      if (list1[index] != list2[index]) count++;
      index++;
      if (index < listSize)
        yield JuegoIniciadoState(
            contador: count, palabra: list1[index], titulo: "The word is....");
      else
        yield JuegoEndState(contador: count, titulo: "You Scored");
    } else if (event is GotEvent) {
      if (list1[index] == list2[index]) count++;
      index++;
      if (index < listSize)
        yield JuegoIniciadoState(
            contador: count, palabra: list1[index], titulo: "The word is....");
      else
        yield JuegoEndState(contador: count, titulo: "You Scored");
    } else if (event is EndEvent) {
      yield JuegoEndState(contador: count, titulo: "You Scored");
    }
  }
}
