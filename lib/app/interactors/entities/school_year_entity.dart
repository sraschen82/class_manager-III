import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:isar/isar.dart';
part 'school_year_entity.g.dart';
@embedded
class SchoolYear {
  int? year;
  List<Discipline>? disicplines;
  SchoolYear();

  factory SchoolYear.empty() => SchoolYear()
    ..year = DateTime.now().year
    ..disicplines = [];
}

 
