import 'main_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenHELPMEState());

  void calculate(String field1, String field2, String field3) {
    final f1 = double.tryParse(field1) ?? 0;
    final f2 = double.tryParse(field2) ?? 0;
    final f3 = double.tryParse(field3) ?? 0;

    emit(MainScreenUpdateCounterState(value: f1 * f2 * f3));
  }

  void showForm() {
    emit(MainScreenHELPMEState());
  }
}