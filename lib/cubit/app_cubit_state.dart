import 'package:equatable/equatable.dart';
import 'package:fair_travel/model/data_model.dart';

abstract class CubitStates extends Equatable {
  @override
  List<Object?> get props => []; // Default empty props
}

// Example of a default or loading state
class InitialState extends CubitStates {
  final int x;

  InitialState({this.x = 0});

  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

// Shown when app starts
class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

// Add other states like LoadedState, DetailState, etc., as needed
