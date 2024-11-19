import 'package:isar/isar.dart';
part 'student_entity.g.dart';
@embedded
class Student {
  String name = '';

  List<double> firstQuarterGrades = [];
  List<double> secondQuarterGrades = [];
  List<double> thirdQuarterGrades = [];
  double? finalGrade1;
  double? finalGrade2;
  double? finalGrade3;
  double? revaluationGrade1;
  double? revaluationGrade2;
   double? finalRevaluationGrade;

  Student();
}
