import 'package:isar/isar.dart';
part 'note_entity.g.dart';
@embedded
class Note {
  String? title;
  String? description;
  bool? check;

  Note();

  factory Note.empty() => Note()
    ..title = ''
    ..description = ''
    ..check = null;
}
