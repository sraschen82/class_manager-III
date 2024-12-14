import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:class_manager/app/ui/extentions/num_ext.dart';

class StudentStore {
  final SchoolClassStore classStore;

  StudentStore({required this.classStore});

  Future<void> addStudentInClass(
      {required Student newStudent,
      required SchoolClass schoolClass,
      required Discipline discipline}) async {
    List<Student> newList = [];
    if (schoolClass.students != null) {
      newList.addAll(schoolClass.students!);
    }

    newList.add(newStudent);
    newList.sort(
      (a, b) => a.name.compareTo(b.name),
    );

    SchoolClass newClass = SchoolClass()
      ..name = schoolClass.name
      ..students = newList;
    await classStore.editClass(
        newClass: newClass, oldClass: schoolClass, discipline: discipline);
  }



  Future<void> addStudentsByList(
      {required String listNames,
      required SchoolClass schoolClass,
      required Discipline discipline}) async {
    List<Student> newList = [];
    if (schoolClass.students != null) {
      newList.addAll(schoolClass.students!);
    }

    List<String> studentNameList = listNames.split('\n');

    for (String studentName in studentNameList) {
      String regex =
          r'[^\p{Alphabetic}\p{Mark}\p{Decimal_Number}\p{Connector_Punctuation}\p{Join_Control}\s]+';

      String studentRegex =
          studentName.replaceAll(RegExp(regex, unicode: true), '');

      final Student newStudent = Student()..name = studentRegex;
      newList.add(newStudent);
    }
    newList.removeWhere((element) => element.name == '');

    newList.sort(
      (a, b) => a.name.compareTo(b.name),
    );
    SchoolClass newClass = SchoolClass()
      ..name = schoolClass.name
      ..students = newList;
    await classStore.editClass(
        newClass: newClass, oldClass: schoolClass, discipline: discipline);
  }

  Future<void> editStudent(
      {required Student editedStudent,
      required Student oldStudent,
      required SchoolClass schoolClass,
      required Discipline discipline}) async {
    List<Student> newList = [];
    if (schoolClass.students != null) {
      newList.addAll(schoolClass.students!);
    }
    newList.removeWhere(
      (element) => element.name == oldStudent.name,
    );

    newList.add(editedStudent);
    newList.sort(
      (a, b) => a.name.compareTo(b.name),
    );

    SchoolClass newClass = SchoolClass()
      ..name = schoolClass.name
      ..students = newList;
    await classStore.editClass(
        newClass: newClass, oldClass: schoolClass, discipline: discipline);
  }

  Future<void> deleteStudent(
      {required Student student,
      required SchoolClass schoolClass,
      required Discipline discipline}) async {
    List<Student> newList = [];
    if (schoolClass.students != null) {
      newList.addAll(schoolClass.students!);
    }

    newList.removeWhere(
      (element) => element.name == student.name,
    );
    newList.sort(
      (a, b) => a.name.compareTo(b.name),
    );

    SchoolClass newClass = SchoolClass()
      ..name = schoolClass.name
      ..students = newList;
    await classStore.editClass(
        newClass: newClass, oldClass: schoolClass, discipline: discipline);
  }

  Future<void> changeStudentClass(
      {required Student student,
      required SchoolClass newClass,
      required SchoolClass oldClass,
      required Discipline discipline}) async {
    await deleteStudent(
        student: student, schoolClass: oldClass, discipline: discipline);
    await addStudentInClass(
        newStudent: student, schoolClass: newClass, discipline: discipline);
  }

  Future<void> addQuarterScore(
      {required Student student,
      required int quarterNumb,
      required double score,
      required SchoolClass schoolClass,
      required Discipline discipline}) async {
    Student editedStudent = student;
    List<double> scores = [];

    switch (quarterNumb) {
      case 1:
        {
          scores.addAll(editedStudent.firstQuarterGrades);
          scores.add(score);
          editedStudent.firstQuarterGrades = scores;

          await editStudent(
              editedStudent: editedStudent,
              oldStudent: student,
              schoolClass: schoolClass,
              discipline: discipline);
        }
      case 2:
        {
          scores.addAll(editedStudent.secondQuarterGrades);
          scores.add(score);
          editedStudent.secondQuarterGrades = scores;
          await editStudent(
              editedStudent: editedStudent,
              oldStudent: student,
              schoolClass: schoolClass,
              discipline: discipline);
        }
      case 3:
        {
          scores.addAll(editedStudent.thirdQuarterGrades);
          scores.add(score);
          editedStudent.thirdQuarterGrades = scores;
          await editStudent(
              editedStudent: editedStudent,
              oldStudent: student,
              schoolClass: schoolClass,
              discipline: discipline);
        }
    }
  }

  Future<void> editQuarterScores(
      {required Student student,
      required int quarter,
      required List<double> scores,
      required SchoolClass schoolClass,
      required Discipline discipline}) async {
    Student editedStudent = student;

    switch (quarter) {
      case 1:
        {
          editedStudent.firstQuarterGrades = scores;

          await editStudent(
              editedStudent: editedStudent,
              oldStudent: student,
              schoolClass: schoolClass,
              discipline: discipline);
        }
      case 2:
        {
          editedStudent.secondQuarterGrades = scores;
          await editStudent(
              editedStudent: editedStudent,
              oldStudent: student,
              schoolClass: schoolClass,
              discipline: discipline);
        }
      case 3:
        {
          editedStudent.thirdQuarterGrades = scores;
          await editStudent(
              editedStudent: editedStudent,
              oldStudent: student,
              schoolClass: schoolClass,
              discipline: discipline);
        }
    }
  }

  Future<void> comfirmQuarterGrade(
      {required Student student,
      required int quarterNumb,
      required SchoolClass schoolClass,
      required Discipline discipline}) async {
    Student editedStudent = student;
    double quarterScore = 0;

    switch (quarterNumb) {
      case 1:
        {
          quarterScore = student.firstQuarterGrades.fold(
            quarterScore,
            (previousValue, element) => previousValue + element,
          );
          editedStudent.finalGrade1 = quarterScore.finalQuarterGradeRound();

          await editStudent(
              editedStudent: editedStudent,
              oldStudent: student,
              schoolClass: schoolClass,
              discipline: discipline);
        }
      case 2:
        {
          quarterScore = student.secondQuarterGrades.fold(
            quarterScore,
            (previousValue, element) => previousValue + element,
          );
          editedStudent.finalGrade2 = quarterScore.finalQuarterGradeRound();
          await editStudent(
              editedStudent: editedStudent,
              oldStudent: student,
              schoolClass: schoolClass,
              discipline: discipline);
        }
      case 3:
        {
          quarterScore = student.thirdQuarterGrades.fold(
            quarterScore,
            (previousValue, element) => previousValue + element,
          );
          editedStudent.finalGrade3 = quarterScore.finalQuarterGradeRound();
          await editStudent(
              editedStudent: editedStudent,
              oldStudent: student,
              schoolClass: schoolClass,
              discipline: discipline);
        }
    }
  }

  
}
