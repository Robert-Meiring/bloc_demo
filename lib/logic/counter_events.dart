import 'package:equatable/equatable.dart';
//The events abstract class is used as an efficient way to send data and instructions to our BLoC

abstract class CounterEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class AddMyNumbers extends CounterEvents {
  final int num1;
  final int num2;

  AddMyNumbers({required this.num1, required this.num2});
}
