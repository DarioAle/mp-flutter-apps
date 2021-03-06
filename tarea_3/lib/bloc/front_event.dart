part of 'front_bloc.dart';

@immutable
abstract class FrontEvent extends Equatable {}

class StartEvent extends FrontEvent {
  @override
  List<Object> get props => [];
}

class SkipEvent extends FrontEvent {
  final bool result = false;
  @override
  List<Object> get props => [result];
}

class GotEvent extends FrontEvent {
  final bool result = true;
  @override
  List<Object> get props => [result];
}

class EndEvent extends FrontEvent {
  @override
  List<Object> get props => [];
}
