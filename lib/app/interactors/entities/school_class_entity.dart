import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:isar/isar.dart';
part 'school_class_entity.g.dart';
@embedded
class SchoolClass {
  String? name;
  List<Student>? students;

  SchoolClass();

  factory SchoolClass.empty() => SchoolClass()
    ..name = ''
    ..students = [];
}
