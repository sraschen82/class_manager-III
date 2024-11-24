import 'dart:async';

import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/interactors/entities/user_entity.dart';
import 'package:class_manager/app/interactors/states/school_class_states.dart';

class SchoolClassStore {
  final DataBase db;

  SchoolClassStore({required this.db});

  final _controller = StreamController<SchoolClassStates>.broadcast();

  Stream<SchoolClassStates> get classStream => _controller.stream;

  Future<List<SchoolClass>> _fetchClasses(
      {required Discipline discipline}) async {
    List<SchoolClass> list = [];
    List<SchoolClass>? classes;

    if (db.user.schoolYears.first.disicplines != null) {
      classes = db.user.schoolYears.first.disicplines!
          .firstWhere(
            (element) => element.longName == discipline.longName,
          )
          .classes;
      if (classes != null) {
        list.addAll(classes);
      }
    }

    return list;
  }

  Future<List<SchoolClass>> getClasses({required Discipline discipline}) async {
    SchoolClassStates state = Loading();
    _controller.sink.add(state);

    List<SchoolClass> list = [];
    await _fetchClasses(discipline: discipline).then(
      (value) => list.addAll(value),
    );

    if (list.isEmpty) {
      state = Empty();
    } else {
      state = Loaded(schoolClasses: list);
    }
    _controller.sink.add(state);

    return list;
  }

  Future<void> addClass(
      {required SchoolClass newClass, required Discipline discipline}) async {
    SchoolClassStates state = Loading();
    _controller.sink.add(state);
    List<SchoolClass> list = [];
    await _fetchClasses(discipline: discipline).then(
      (value) => list.addAll(value),
    );

    try {
      list.add(newClass);
      list.sort((a, b) => a.name!.compareTo(b.name!));
      User newUser = db.user;
      newUser.schoolYears.first.disicplines!
          .firstWhere((element) => element.longName == discipline.longName)
          .classes = list;

      await db.saveUser(user: newUser);
      state = Loaded(schoolClasses: list);
    } catch (e) {
      state = Error(message: 'Erro ao salvar a turma');
      _controller.sink.add(state);
      await Future.delayed(Duration(seconds: 3));
      state = Loaded(schoolClasses: list);
    }
    _controller.sink.add(state);
  }

  Future<void> editClass(
      {required SchoolClass newClass,
      required SchoolClass oldClass,
      required Discipline discipline}) async {
    SchoolClassStates state = Loading();
    _controller.sink.add(state);
    List<SchoolClass> list = await _fetchClasses(discipline: discipline);

    try {
      list.removeWhere(
        (element) => element.name == oldClass.name,
      );
      list.add(newClass);
      list.sort(
        (a, b) => a.name!.compareTo(b.name!),
      );
      User newUser = db.user;

      newUser.schoolYears.first.disicplines!
          .firstWhere((element) => element.longName == discipline.longName)
          .classes = list;

      await db.saveUser(user: newUser);
      state = Loaded(schoolClasses: list);
    } catch (e) {
      state = Error(message: 'Erro ao salvar as alterações.');
      _controller.sink.add(state);
      await Future.delayed(Duration(seconds: 3));
      state = Loaded(schoolClasses: list);
    }
    _controller.sink.add(state);
  }

  Future<void> deleteClass(
      {required SchoolClass newClass, required Discipline discipline}) async {
    SchoolClassStates state = Loading();
    _controller.sink.add(state);
    List<SchoolClass> list = await _fetchClasses(discipline: discipline);

    try {
      list.removeWhere(
        (element) => element.name == newClass.name,
      );
      User newUser = db.user;
      newUser.schoolYears.first.disicplines!
          .firstWhere((element) => element.longName == discipline.longName)
          .classes = list;

      await db.saveUser(user: newUser);
      state = Loaded(schoolClasses: list);
    } catch (e) {
      state = Error(message: 'Erro ao remover a turma');
      _controller.sink.add(state);
      await Future.delayed(Duration(seconds: 3));
      state = Loaded(schoolClasses: list);
    }
    _controller.sink.add(state);
  }

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
    await editClass(
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
    await editClass(
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
    await editClass(
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
    await editClass(
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
}
