import 'package:class_manager/app/interactors/entities/schedulles_entity.dart';

extension SchedullesExt on Schedulles {
  bool isEmpty() {
    bool isEmpty = false;
    if (this.haveMornigClass() == false && this.haveAfternoonClass() == false) {
      isEmpty = true;
    }

    return isEmpty;
  }

  List<String> numberOfTables() {
    List<String> numbOfTables = [];
    if (this.haveMornigClass()) {
      numbOfTables.add('M');
    }
    if (this.haveAfternoonClass()) {
      numbOfTables.add('T');
    }

    return numbOfTables;
  }

  List<String> weekdays() => ['SEG', 'TER', 'QUA', 'QUI', 'SEX'];
}
