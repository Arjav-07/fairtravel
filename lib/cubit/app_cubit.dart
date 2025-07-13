import 'package:fair_travel/model/data_model.dart';
import 'package:fair_travel/services/data_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_cubit_state.dart';

class AppCubits extends Cubit<CubitStates> {
  final DataServices data;
  late List<DataModel> places;

  AppCubits({required this.data}) : super(InitialState()) {
    getData();
  }

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void detailPage(DataModel place) {
    emit(DetailState(place));
  }

  void goHome() {
    emit(LoadedState(places));
  }
}
