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
  LoadedState(this.places);

  @override
  List<Object> get props => [places];
}

class ErrorState extends CubitStates {
  final String message;
  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
