

import 'package:bloc/bloc.dart';
import 'package:bloc_contact_app/bloc/counter/counter_event.dart';
import 'package:bloc_contact_app/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{


    CounterBloc(): super(CounterDataState(counter: 0)){
      on<CounterEvent>(_mapEventToState);
    }

    Future<void> _mapEventToState(CounterEvent event, Emitter<CounterState> emit) async{
      
          if(event is InitialCounterEvent){
            emit(CounterDataState(counter: 0));
          }
          if(event is IncrementCounterEvent){
            emit(CounterDataState(counter: event.counter + 1));
          }
          if(event is DecrementCounterEvent){
            emit(CounterDataState(counter: event.counter - 1));
          }
      
    }

}