import 'package:class_manager/app/data/data_base/abstract_db_repository.dart';
import 'package:class_manager/app/interactors/entities/user_entity.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarRepository implements DbRepository {
  late Isar _isar;

  @override
  Future<void> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();

      _isar =
          await Isar.open([UserSchema], directory: dir.path, inspector: true);
    } else {
      _isar = await Future.value(Isar.getInstance());
    }
  }

  @override
  Future<User?> fetchUser() async {
    await openDb();

    User? user;
    await _isar.txn(() async {
      user = await _isar.collection<User>().where().findFirst();
    });

    // await _isar.close();
    return user;
  }

  @override
  Future<void> saveUser(User user) async {
    await openDb();
    print('User id: ${user.id}');
    await _isar.writeTxn(() async {
      await _isar.user.clear();
      await _isar.user.put(user);
      // await _isar.collection<User>().put(user);
    });
  }

  @override
  Future<void> deleteUser(int id) async {
    await openDb();

    await _isar.writeTxn(() async {
      await _isar.collection<User>().delete(id);
    });
  }
}
