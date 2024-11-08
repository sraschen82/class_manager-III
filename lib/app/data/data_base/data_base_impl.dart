import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/data/data_base/abstract_db_repository.dart';
import 'package:class_manager/app/interactors/entities/user_entity.dart';

class DataBaseImpl extends DataBase {
  DbRepository repository;

  late User _user;

  DataBaseImpl({required this.repository}) {}

  @override
  User get user => _user;

  @override
  set user(User user) => _user = user;

  @override
  Future<User> fetchUser() async {
    _user = User.empty();
    User? user;

    user = await repository.fetchUser();

    if (user != null) {
      _user = user;
      print('Usuário carregado com sucesso. ${_user.credentials?.name}');
    }

    return _user;
  }

  @override
  Future<void> saveUser({required User user}) async {
    try {
      await repository.saveUser(user);
      _user = user;
    } catch (e) {
      print('Erro ao salvar usuário');
    }
  }

  @override
  Future<void> deleteUser({required User user}) async {
    try {
      await repository.deleteUser(user.id);
      _user = User.empty();
    } catch (e) {
      print('Erro ao remover usuário');
    }
  }
}
