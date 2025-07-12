import 'package:fair_travel/cubit/app_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
  }
}
