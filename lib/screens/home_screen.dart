import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/dependency_injection/register_factory.dart';
import 'package:test_app/logic/counter_bloc.dart';
import 'package:test_app/logic/counter_events.dart';
import 'package:test_app/logic/counter_states.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  //Assign our bloc variable using our DI
  final CounterBloc _bloc = sl.get<CounterBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            //detect state change, if success state show result, else our input widgets
            return state is CounterSuccessState
                ? Center(child: Text(state.result.toString()))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: const InputDecoration(helperText: 'Number 1'),
                          controller: _num1Controller,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: const InputDecoration(helperText: 'Number 2'),
                          controller: _num2Controller,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Material(
                        elevation: 8,
                        child: InkWell(
                          onTap: () {
                            //send event to bloc with our two numbers
                            _bloc.add(
                              AddMyNumbers(
                                num1: int.parse(_num1Controller.text),
                                num2: int.parse(_num2Controller.text),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Add'),
                          ),
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
