import 'package:dio/dio.dart';
import 'package:scaffold_project/Domain/DTO/UserDTO.dart';

import 'package:scaffold_project/Infra/Repositories/config_repositories/user/i_config_user_repository.dart';

class ConfigUserRepository implements IConfigUserRepository {
  late Dio _dio;

  ConfigUserRepository(Dio dio) {
    _dio = dio;
  }

  @override
  Future getInfUser(int id) async {
    var result = await _dio.post('/get-user', data: {"userId": 1});

    // var result = await _database.rawQuery('SELECT * FROM usuario WHERE id = 1');
    // return result.first;
    return result.data;
  }

  @override
  Future updateInfUser(UserDTO userInf) async {
    // await _database.rawUpdate(
    //   'UPDATE usuario SET nome = ?, sobrenome = ?, email = ?, data_nascimento = ?, telefone = ? WHERE id = ?',
    //   [
    //     userInf.name,
    //     userInf.lastName,
    //     userInf.email,
    //     userInf.birthDate,
    //     userInf.phoneNumber,
    //     1
    //   ],
    // );

    // var result = await _database.rawQuery('SELECT * FROM usuario WHERE id = 1');
    // return result.first;
    return null;
  }

  @override
  Future createUser(UserDTO value) {
    // TODO: implement createUser
    throw UnimplementedError();
  }
}
