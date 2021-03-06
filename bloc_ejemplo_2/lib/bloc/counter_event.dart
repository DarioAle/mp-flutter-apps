part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class ModifyCounterEvent extends CounterEvent {

  final bool isIncrement;

  ModifyCounterEvent({@required this.isIncrement});


  @override
  List<Object> get props => [isIncrement];

}