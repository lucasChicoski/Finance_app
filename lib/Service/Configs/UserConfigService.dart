import 'package:scaffold_project/Domain/DTO/UserDTO.dart';
import 'package:scaffold_project/Domain/Models/UserConfigModel.dart';
import 'package:scaffold_project/Infra/Repositories/config_repositories/user/config_user_repository.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class UserConfigService {
  final ConfigUserRepository _repo =
      RepositoryFactory.getRepository(RepositoryType.configUserRepository);

  Future<UserConfigmodel> getInfUserService() async {
    var user = await _repo.getInfUser(1);
    UserConfigmodel userConfInf = UserConfigmodel(user);
    return userConfInf;
  }

  Future<UserConfigmodel> updateInfUserService(UserDTO value) async {
    var result = await _repo.updateInfUser(value);
    UserConfigmodel userConfInf = UserConfigmodel(result);
    return userConfInf;
  }

  Future createUser(UserDTO value) async {
    return await _repo.createUser(value);
  }
}
