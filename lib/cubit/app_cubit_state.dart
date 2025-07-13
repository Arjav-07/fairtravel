import 'package:equatable/equatable.dart';
import 'package:fair_travel/model/data_model.dart';

abstract class CubitStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends CubitStates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  final List<DataModel> places;
  LoadedState(this.places);

  @override
  List<Object> get props => [places];
}

class DetailState extends CubitStates {
  final DataModel place;
  DetailState(this.place);

  @override
  List<Object> get props => [place];
}

class ErrorState extends CubitStates {
  final String places;
  ErrorState(this.places);

  @override
  List<Object> get props => [places];
}
