import 'package:isar/isar.dart';

part 'schedulles_entity.g.dart';

@embedded
class Schedulles {
  List<String> mondayMorning = [];
  List<String> mondayAfternoon = [];
  List<String> tuesdayMorning = [];
  List<String> tuesdayAfternoon = [];
  List<String> wednesdayMorning = [];
  List<String> wednesdayAfternoon = [];
  List<String> thursdayMorning = [];
  List<String> thursdayAfternoon = [];
  List<String> fridayMorning = [];
  List<String> fridayAfternoon = [];

  Schedulles();

  factory Schedulles.empty() => Schedulles();

  List<String> periodList() => [
        '1º',
        '2º',
        '3º',
        '4º',
        '5º',
        '6º',
      ];

  bool haveMornigClass() {
    bool have = true;
    if (this.mondayMorning.isEmpty &&
        this.tuesdayMorning.isEmpty &&
        this.wednesdayMorning.isEmpty &&
        this.thursdayMorning.isEmpty &&
        this.fridayMorning.isEmpty) {
      have = false;
    }

    return have;
  }

  bool haveAfternoonClass() {
    bool have = true;
    if (this.mondayAfternoon.isEmpty &&
        this.tuesdayAfternoon.isEmpty &&
        this.wednesdayAfternoon.isEmpty &&
        this.thursdayAfternoon.isEmpty &&
        this.fridayAfternoon.isEmpty) {
      have = false;
    }

    return have;
  }
  
}
