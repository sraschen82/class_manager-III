import 'package:class_manager/app/interactors/entities/discipline_entity.dart';

sealed class DisciplineStates {}

class Empty extends DisciplineStates {}

class Loading extends DisciplineStates {}

class Loaded extends DisciplineStates {
  final List<Discipline> disciplines;

  Loaded({required this.disciplines});
}

class Error extends DisciplineStates {
  final String message;

  Error({required this.message});
}
