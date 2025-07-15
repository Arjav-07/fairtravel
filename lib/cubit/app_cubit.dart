import 'package:fair_travel/model/data_model.dart';
import 'package:fair_travel/services/data_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_cubit_state.dart';

class AppCubits extends Cubit<CubitStates> {
  final DataServices data;
  late List<DataModel> places;
  List<DataModel> favorites = [];

  AppCubits({required this.data}) : super(InitialState()) {
    getData();
  }

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places, favorites));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void detailPage(DataModel place) {
    emit(DetailState(place, favorites));
  }

  void goHome() {
    emit(LoadedState(places, favorites));
  }

  void toggleFavorite(DataModel place) {
    if (favorites.contains(place)) {
      favorites.remove(place);
    } else {
      favorites.add(place);
    }

    // Emit updated state based on current context
    if (state is DetailState) {
      final current = state as DetailState;
      emit(DetailState(current.place, favorites));
    } else {
      emit(LoadedState(places, favorites));
    }
  }
}
