

abstract class CounterState{}

class CounterDataState extends CounterState{
     final int counter;
     CounterDataState({required this.counter});
}