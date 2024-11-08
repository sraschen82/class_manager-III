



import 'package:class_manager/app/interactors/entities/user_entity.dart';

abstract class DbRepository {
  Future<void> openDb();
  Future<User?> fetchUser();
  Future<void> saveUser(User user);
  Future<void> deleteUser(int id);
}
