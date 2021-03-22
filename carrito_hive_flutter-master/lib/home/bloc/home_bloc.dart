import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_hive/home/item_home.dart';
import 'package:cart_hive/model/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // referencia a la box previamente abierta (en el main)
  Box _cartBox = Hive.box("Carrito");

  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is AddToCartEvent) {
      var cartElements = _cartBox.get("bebidas", defaultValue: []);
      cartElements.add(event.product);
      await _cartBox.put("bebidas", cartElements);
      yield ElementAddedState();
    }
  }
}
