import 'package:class_manager/app/interactors/entities/school_class_entity.dart';

sealed class SchoolClassStates {}

class Empty extends SchoolClassStates {}

class Loading extends SchoolClassStates {}

class Loaded extends SchoolClassStates {
  final List<SchoolClass> schoolClasses;

  Loaded({required this.schoolClasses});
}

class Error extends SchoolClassStates {
  final String message;

  Error({required this.message});
}
