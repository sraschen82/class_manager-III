import 'dart:async';

import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/schedulles_entity.dart';
import 'package:class_manager/app/interactors/states/schedulles_states.dart';
import 'package:class_manager/app/ui/extentions/schedulles_ext.dart';

class SchedullesStore {
  final DataBase db;

  SchedullesStore({required this.db});

  final _controller = StreamController<SchedullesStates>.broadcast();

  Stream<SchedullesStates> get schedullesStream => _controller.stream;

  Future<Schedulles?> getSchedulles() async {
    SchedullesStates state = Loading();
    _controller.sink.add(state);
    Schedulles? schedulles = db.user.schedulles;
    try {
      schedulles != null && !schedulles.isEmpty()
          ? {
              state = Loaded(schedulles: schedulles),
            }
          : state = Empty();
    } catch (e) {
      state = Error(message: 'Erro ao carregar os horárioss.');
      _controller.add(state);
      await Future.delayed(const Duration(seconds: 3));
      state = Empty();
    }
    _controller.add(state);
    return schedulles;
  }

  Future<void> saveSchedulles({required Schedulles newSchedulles}) async {
    SchedullesStates state = Loading();
    _controller.add(state);
    Schedulles? oldSchedulles = db.user.schedulles;

    try {
      await db.saveUser(user: db.user.copyWith(schedulles: newSchedulles));

      state = Loaded(schedulles: newSchedulles);
    } catch (e) {
      state = Error(message: 'Erro ao salvar o novo horário.');
      _controller.add(state);
      await Future.delayed(const Duration(seconds: 3));
      oldSchedulles != null
          ? state = Loaded(schedulles: oldSchedulles)
          : state = Empty();
    }

    _controller.add(state);
  }

  Future<void> deleteSchedulles({required Schedulles schedulles}) async {
    SchedullesStates state = Loading();
    _controller.add(state);
    Schedulles? oldSchedulles = db.user.schedulles;

    try {
      await db.saveUser(user: db.user.copyWith(schedulles: null));
      state = Empty();
    } catch (e) {
      state = Error(message: 'Erro ao remover o ano letivo.');
      _controller.sink.add(state);
      await Future.delayed(const Duration(seconds: 3));
      oldSchedulles != null
          ? state = Loaded(schedulles: oldSchedulles)
          : state = Empty();
    }

    _controller.sink.add(state);
  }

  bool checkCreatingSchedullesCondictions() {
    bool haveAnyClass = false;
    if (db.user.schoolYears.first.disicplines != null &&
        db.user.schoolYears.first.disicplines!
            .any((element) => element.classes != null)) {
      haveAnyClass = true;
    }

    return haveAnyClass;
  }

  void dispose() => _controller.close();
}
