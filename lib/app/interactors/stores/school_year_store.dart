import 'dart:async';

import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/school_year_entity.dart';
import 'package:class_manager/app/interactors/states/school_year_states.dart';

class SchoolYearStore {
  final DataBase db;

  SchoolYearStore({required this.db});

  final _controller = StreamController<SchoolYearStates>.broadcast();

  Stream<SchoolYearStates> get schoolYearStream => _controller.stream;

  Future<List<SchoolYear>> getAllSchoolYears() async {
    SchoolYearStates state = Loading();
    _controller.sink.add(state);
    print('getAllSchoolYears: ${state}');
    List<SchoolYear> list = [];
    try {
      db.user.schoolYears.isNotEmpty
          ? {
              list.addAll(db.user.schoolYears),
              state = Loaded(schoolYears: list),
            }
          : state = Empty();
    } catch (e) {
      state = Error(message: 'Erro ao carregar os anos letivos.');
      _controller.add(state);
      await Future.delayed(const Duration(seconds: 3));
      state = Empty();
    }

    _controller.add(state);

    return list;
  }

  Future<void> saveSchoolYear({required SchoolYear schoolYear}) async {
    SchoolYearStates state = Loading();
    _controller.sink.add(state);
    List<SchoolYear> list = [];
    list.addAll(db.user.schoolYears);
    if (list.any((element) => element.year == schoolYear.year)) {
      final int index = list.indexOf(list.firstWhere(
        (element) => element.year == schoolYear.year,
      ));

      list.removeWhere((element) => element.year == schoolYear.year);
      list.insert(index, schoolYear);

      try {
        await db.saveUser(user: db.user.copyWith(schoolYears: list));

        state = Loaded(schoolYears: list);
      } catch (e) {
        state = Error(message: 'Erro ao salvar o ano letivo.');
        _controller.add(state);
        await Future.delayed(const Duration(seconds: 3));
        state = Loaded(schoolYears: list);
      }
    } else {
      try {
        list.add(schoolYear);
        await db.saveUser(user: db.user.copyWith(schoolYears: list));

        state = Loaded(schoolYears: list);
      } catch (e) {
        state = Error(message: 'Erro ao salvar o ano letivo.');
        _controller.add(state);
        await Future.delayed(const Duration(seconds: 3));
        state = Loaded(schoolYears: list);
      }
    }

    _controller.add(state);
  }

  Future<void> deleteSchoolYear({required SchoolYear schoolYear}) async {
    SchoolYearStates state = Loading();
    _controller.sink.add(state);
    List<SchoolYear> list = [];
    list.addAll(db.user.schoolYears);
    try {
      list.remove(schoolYear);
      await db.saveUser(user: db.user.copyWith(schoolYears: list));
      list.length > 0 ? state = Loaded(schoolYears: list) : state = Empty();
    } catch (e) {
      state = Error(message: 'Erro ao remover o ano letivo.');
      _controller.sink.add(state);
      await Future.delayed(const Duration(seconds: 3));
      state = Loaded(schoolYears: list);
    }

    _controller.sink.add(state);
  }

  Future<void> selectSchoolYear({required SchoolYear schoolYear}) async {
    SchoolYearStates state = Loading();
    _controller.sink.add(state);
    List<SchoolYear> list = [];
    list.addAll(db.user.schoolYears);
    list.removeWhere((element) => element.year == schoolYear.year);
    list.insert(0, schoolYear);

    try {
      await db.saveUser(user: db.user.copyWith(schoolYears: list));
      state = Loaded(schoolYears: list);
    } catch (e) {
      state = Error(message: 'Erro ao selecionar o ano letivo.');
      _controller.sink.add(state);
      await Future.delayed(const Duration(seconds: 3));
      state = Loaded(schoolYears: list);
    }

    _controller.sink.add(state);
  }

  void dispose() => _controller.close();
}
