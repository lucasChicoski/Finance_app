import 'package:scaffold_project/Domain/DTO/UserDTO.dart';
import 'package:scaffold_project/Domain/Models/UserConfigModel.dart';
import 'package:scaffold_project/Service/Configs/UserConfigService.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class UserApplication {
  Future getInfUser() async {
    UserConfigService userConfigService =
        ServiceFactory.getService(ServiceType.userConfigService);

    UserConfigmodel userConfigmodel =
        await userConfigService.getInfUserService();

    return userConfigmodel;
  }

  Future updateInfUser(Map<String, dynamic> value) async {
    UserConfigService userConfigService =
        ServiceFactory.getService(ServiceType.userConfigService);

    UserDTO userDTO = UserDTO.fromJson(value);

    UserConfigmodel userConfigmodel =
        await userConfigService.updateInfUserService(userDTO);
    return userConfigmodel;
  }
}
