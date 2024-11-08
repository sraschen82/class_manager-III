import 'package:isar/isar.dart';
part 'credentials_entity.g.dart';
@embedded
class Credentials {
  String? name;
  String? email;
  String? password;
  Credentials();

  factory Credentials.empty() => Credentials()
    ..name = ''
    ..email = ''
    ..password = '';
}
