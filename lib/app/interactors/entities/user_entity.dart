import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/school_year_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/packages/loggin_pct/credentials_entity.dart';
import 'package:class_manager/app/packages/notes_pct/interactors/note_entity.dart';
import 'package:isar/isar.dart';

part 'user_entity.g.dart';

@Collection(accessor: 'user')
class User {
  Id id = Isar.autoIncrement;
  Credentials? credentials;
  List<Note> notesList = [];
  String? pathSchedules;
  List<SchoolYear> schoolYears;

  User(this.credentials, this.notesList, this.schoolYears);

  factory User.empty() => User(Credentials.empty(), [], []);

  User copyWith(
          {Credentials? credentials,
          List<Note>? notesList,
          List<SchoolYear>? schoolYears}) =>
      User(credentials ?? this.credentials, notesList ?? this.notesList,
          schoolYears ?? this.schoolYears);
}
