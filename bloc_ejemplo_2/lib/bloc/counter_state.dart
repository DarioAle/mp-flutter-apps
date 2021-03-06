part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
  
  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {}

class NewCounterState extends CounterState {
  final int currentCount;

  NewCounterState({@required this.currentCount});

  @override
  List<Object> get props => [currentCount];


}
