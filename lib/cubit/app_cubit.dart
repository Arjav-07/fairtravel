import 'package:fair_travel/model/data_model.dart';
import 'package:fair_travel/pages/nav_pages/detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fair_travel/services/data_services.dart';
import 'package:fair_travel/cubit/app_cubit_state.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;

  void getData() async {
    try {
      emit(LoadingState());
      final places = await data.getInfo();
      emit(LoadedState(places)); // Navigates to HomePage
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
    DetailPage(DataModel data) {
      emit(DetailState(data));
    }
  }
}
