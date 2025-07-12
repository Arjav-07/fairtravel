import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  late int x;
  @override
  // TODO: implement props
  List<Object> get props => [x];
}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
