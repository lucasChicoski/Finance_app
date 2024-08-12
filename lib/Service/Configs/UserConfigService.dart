import 'package:scaffold_project/Domain/DTO/UserDTO.dart';
import 'package:scaffold_project/Domain/Models/UserConfigModel.dart';
import 'package:scaffold_project/Infra/Repositories/config_repositories/user/config_user_repository.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class UserConfigService {
  Future<UserConfigmodel> getInfUserService() async {
    ConfigUserRepository configUserRepository =
        RepositoryFactory.getRepository(RepositoryType.configUserRepository);

    var user = await configUserRepository.getInfUser(1);
    UserConfigmodel userConfInf = UserConfigmodel(user);
    return userConfInf;
  }

  Future<UserConfigmodel> updateInfUserService(UserDTO value) async {
    ConfigUserRepository configUserRepository =
        RepositoryFactory.getRepository(RepositoryType.configUserRepository);

    var result = await configUserRepository.updateInfUser(value);

    UserConfigmodel userConfInf = UserConfigmodel(result);
    return userConfInf;
  }
}
