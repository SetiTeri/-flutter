abstract class MainScreenState{}

class MainScreenHELPMEState extends MainScreenState {}

class MainScreenUpdateCounterState extends MainScreenState{
  final double value;

  MainScreenUpdateCounterState({required this.value});
}