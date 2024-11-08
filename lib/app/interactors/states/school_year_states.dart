import 'package:class_manager/app/interactors/entities/school_year_entity.dart';

sealed class SchoolYearStates {}

class Empty extends SchoolYearStates {}

class Loading extends SchoolYearStates {}

class Loaded extends SchoolYearStates {
  List<SchoolYear> schoolYears;
  Loaded({required this.schoolYears});
}

class Error extends SchoolYearStates {
  final String message;

  Error({required this.message});
}
