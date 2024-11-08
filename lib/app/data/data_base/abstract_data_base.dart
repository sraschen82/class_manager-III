import 'package:class_manager/app/interactors/entities/user_entity.dart';

abstract class DataBase {
  User get user;
  set user(User user);
  Future<User> fetchUser();
  Future<void> saveUser({required User user});
  Future<void> deleteUser({required User user});
}
