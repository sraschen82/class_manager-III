import 'package:class_manager/app/interactors/entities/schedulles_entity.dart';

sealed class SchedullesStates {}

class Empty extends SchedullesStates {}

class Loading extends SchedullesStates {}

class Loaded extends SchedullesStates {
  final Schedulles schedulles;

  Loaded({required this.schedulles});
}

class Error extends SchedullesStates {
  final String message;

  Error({required this.message});
}
