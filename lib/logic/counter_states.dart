import 'package:equatable/equatable.dart';
//Our States abstract class is used by our BLoC to communicate back to our widgets.

abstract class CounterStates extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialCounterState extends CounterStates {}

class CounterSuccessState extends CounterStates {
  final int result;

  CounterSuccessState(this.result);
}
