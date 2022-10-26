import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/logic/counter_events.dart';
import 'package:test_app/logic/counter_states.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(InitialCounterState()) {
    //on the addmynumbers event, add the two numbers sent through in the event and return the result
    on<AddMyNumbers>((event, emit) async {
      final int result = event.num1 + event.num2;
      emit(CounterSuccessState(result));
    });
  }
}
