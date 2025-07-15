import 'package:equatable/equatable.dart';
import 'package:fair_travel/model/data_model.dart';

abstract class CubitStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends CubitStates {}

class WelcomeState extends CubitStates {}

class LoadingState extends CubitStates {}

class LoadedState extends CubitStates {
  final List<DataModel> places;
  final List<DataModel> favorites;

  LoadedState(this.places, this.favorites);

  @override
  List<Object?> get props => [places, favorites];
}

class DetailState extends CubitStates {
  final DataModel place;
  final List<DataModel> favorites;

  DetailState(this.place, this.favorites);

  @override
  List<Object?> get props => [place, favorites];
}

class ErrorState extends CubitStates {
  final String message;

  ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
