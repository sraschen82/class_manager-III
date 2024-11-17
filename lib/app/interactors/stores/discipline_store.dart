import 'dart:async';

import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/user_entity.dart';
import 'package:class_manager/app/interactors/states/discipline_states.dart';

class DisciplineStore {
  final DataBase db;

  DisciplineStore({required this.db});

  final _controller = StreamController<DisciplineStates>.broadcast();

  Stream<DisciplineStates> get disciplineStream => _controller.stream;

  Future<List<Discipline>> getDisciplinesByYear({required int year}) async {
    List<Discipline> list = [];
    List<Discipline>? disciplines = db.user.schoolYears
        .firstWhere((schooYear) => schooYear.year == year)
        .disicplines;

    if (disciplines != null && disciplines.isNotEmpty) {
      list.addAll(disciplines);
    }
    return list;
  }

  Future<List<Discipline>> getAllDiscilpine({required int year}) async {
    DisciplineStates state = Loading();
    _controller.sink.add(state);
    List<Discipline> list = [];
    await getDisciplinesByYear(year: year).then(
      (value) => list.addAll(value),
    );
    try {
      list.isNotEmpty
          ? {
              state = Loaded(disciplines: list),
            }
          : state = Empty();
    } catch (e) {
      state = Error(message: 'Algo deu errado, tente novamente mais tarde.');
      _controller.add(state);
      await Future.delayed(const Duration(seconds: 3));
      state = Empty();
    }

    _controller.add(state);

    return list;
  }

  Future<void> saveDiscipline(
      {required int year, required Discipline newDiscipline}) async {
    DisciplineStates state = Loading();
    _controller.sink.add(state);
    List<Discipline> list = [];
    await getDisciplinesByYear(year: year).then(
      (value) => list.addAll(value),
    );
    User newUser = db.user;
    if (list.any((element) => element.longName == newDiscipline.longName)) {
      final int index = list.indexOf(list.firstWhere(
        (element) => element.longName == newDiscipline.longName,
      ));

      list.removeWhere((element) => element.longName == newDiscipline.longName);
      list.insert(index, newDiscipline);

      try {
        newUser.schoolYears
            .firstWhere((element) => element.year == year)
            .disicplines = list;

        await db.saveUser(user: newUser);

        state = Loaded(disciplines: list);
      } catch (e) {
        state = Error(message: 'Algo deu errado, tente novamente mais tarde.');
        _controller.add(state);
        await Future.delayed(const Duration(seconds: 3));
        state = Loaded(disciplines: list);
      }
    } else {
      try {
        list.add(newDiscipline);
        newUser.schoolYears
            .firstWhere((element) => element.year == year)
            .disicplines = list;
        await db.saveUser(user: newUser);

        state = Loaded(disciplines: list);
      } catch (e) {
        state = Error(message: 'Algo deu errado, tente novamente mais tarde.');
        _controller.add(state);
        await Future.delayed(const Duration(seconds: 3));
        state = Loaded(disciplines: list);
      }
    }

    _controller.add(state);
  }

  Future<void> editDiscipline(
      {required int year,
      required Discipline oldDiscipline,
      required Discipline newDiscipline}) async {
    DisciplineStates state = Loading();
    _controller.sink.add(state);
    List<Discipline> list = [];
    await getDisciplinesByYear(year: year).then(
      (value) => list.addAll(value),
    );
    User newUser = db.user;

    int index = list.indexOf(oldDiscipline);
    list.removeWhere((element) => element.longName == oldDiscipline.longName);
    list.insert(index, newDiscipline);

    try {
      newUser.schoolYears
          .firstWhere((element) => element.year == year)
          .disicplines = list;

      await db.saveUser(user: newUser);

      state = Loaded(disciplines: list);
    } catch (e) {
      state = Error(message: 'Algo deu errado, tente novamente mais tarde.');
      _controller.add(state);
      await Future.delayed(const Duration(seconds: 3));
      state = Loaded(disciplines: list);
    }

    _controller.add(state);
  }

  Future<void> deleteDiscipline({required Discipline discipline}) async {
    DisciplineStates state = Loading();
    _controller.sink.add(state);
    List<Discipline> list = [];
    int year = db.user.schoolYears.first.year!;
    await getDisciplinesByYear(year: year).then(
      (value) => list.addAll(value),
    );

    User newUser = db.user;

    list.removeWhere((element) => element.longName == discipline.longName);
    newUser.schoolYears
        .firstWhere((element) => element.year == year)
        .disicplines = list;
    try {
      newUser.schoolYears
          .firstWhere((element) => element.year == year)
          .disicplines = list;

      await db.saveUser(user: newUser);

      state = Loaded(disciplines: list);
    } catch (e) {
      state = Error(message: 'Algo deu errado, tente novamente mais tarde.');
      _controller.sink.add(state);
      await Future.delayed(const Duration(seconds: 3));
      state = Loaded(disciplines: list);
    }

    _controller.sink.add(state);
  }

  void dispose() => _controller.close();
}
