import 'dart:async';

import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/schedulles_entity.dart';
import 'package:class_manager/app/interactors/states/schedulles_states.dart';

class SchedullesStore {
  final DataBase db;

  SchedullesStore({required this.db});

  final _controller = StreamController<SchedullesStates>.broadcast();

  Stream<SchedullesStates> get schedullesStream => _controller.stream;

  Future<Schedulles> getSchedulles() async {
    SchedullesStates state = Loading();

    _controller.sink.add(state);
    print('getAllschedulles: ${state}');
    Schedulles schedulles = Schedulles();
    try {
      // db.user.schedulles.isNotEmpty
      //     ? {

      //         state = Loaded(schedulles ),
      //       }
      //     : state = Empty();
    } catch (e) {
      state = Error(message: 'Erro ao carregar os anos letivos.');
      _controller.add(state);
      await Future.delayed(const Duration(seconds: 3));
      state = Empty();
    }

    _controller.add(state);

    return schedulles;
  }

  Future<void> saveSchedulles({required Schedulles newSchedulles}) async {
    SchedullesStates state = Loading();
    Schedulles schedulles = Schedulles();

    try {
      // await db.saveUser(user: db.user.copyWith(schedulles: list));

      state = Loaded(schedulles: newSchedulles);
    } catch (e) {
      state = Error(message: 'Erro ao salvar o ano letivo.');
      _controller.add(state);
      await Future.delayed(const Duration(seconds: 3));
      state = Loaded(schedulles: newSchedulles);
    }

    _controller.add(state);
  }

  Future<void> deleteSchedulles({required Schedulles schedulles}) async {
    SchedullesStates state = Loading();

    try {
      state = Loaded(schedulles: schedulles);
    } catch (e) {
      state = Error(message: 'Erro ao remover o ano letivo.');
      _controller.sink.add(state);
      await Future.delayed(const Duration(seconds: 3));
      state = Loaded(schedulles: schedulles);
    }

    _controller.sink.add(state);
  }

  void dispose() => _controller.close();
}
