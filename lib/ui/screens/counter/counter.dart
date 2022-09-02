import 'package:bloc_contact_app/bloc/counter/counter_bloc.dart';
import 'package:bloc_contact_app/bloc/counter/counter_event.dart';
import 'package:bloc_contact_app/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterScreen extends StatelessWidget {

  const CounterScreen({ Key? key, this.title }) : super(key: key);

  final String? title;

  static const routeName = "/counter";

  @override
  Widget build(BuildContext context) {
  
    int _counter = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state){
              if(state is CounterDataState){
                _counter = state.counter;
                return Text("${state.counter}", style: Theme.of(context).textTheme.headline2,);
              }
              throw Exception("Error State Incorrect!!!");
        },),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementCounterEvent(counter: _counter));
            },
            child: const Icon(Icons.add),
             ),
        ],
      ),
    );
  }
}


