import 'package:dio/dio.dart';
import 'package:scaffold_project/Domain/DTO/UserDTO.dart';
import 'package:scaffold_project/Global/dio_response.dart';

import 'package:scaffold_project/Infra/Repositories/config_repositories/user/i_config_user_repository.dart';

class ConfigUserRepository implements IConfigUserRepository {
  late Dio _dio;

  ConfigUserRepository(Dio dio) {
    _dio = dio;
  }

  @override
  Future getInfUser(int id) async {
    var result = await _dio.post('/get-user', data: {"userId": 1});
    return result.data;
  }

  @override
  Future updateInfUser(UserDTO userInf) async {
    return null;
  }

  @override
  Future createUser(UserDTO value) async {
    var result = await _dio.post('/create-user', data: value.toJson());
    DioResponse dioResponse =
        DioResponse.fromJson(result.data); //implementar retorno

    return dioResponse;
  }
}
