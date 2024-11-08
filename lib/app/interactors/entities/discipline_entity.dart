import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:isar/isar.dart';
part 'discipline_entity.g.dart';
@embedded
class Discipline {
  String? longName;
  String? shortName;
  bool? isRegularDiscipline;
  List<SchoolClass>? classes;

  Discipline();

  factory Discipline.empty() => Discipline()
    ..longName = ''
    ..shortName = ''
    ..isRegularDiscipline = null
    ..classes = [];
}
