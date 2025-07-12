import 'package:fair_travel/cubit/app_cubit_state.dart';
import 'package:fair_travel/services/data_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
    } catch (e) {}
  }
}
