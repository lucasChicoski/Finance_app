import 'package:scaffold_project/Domain/DTO/UserDTO.dart';
import 'package:scaffold_project/Domain/Models/UserConfigModel.dart';
import 'package:scaffold_project/Service/Configs/UserConfigService.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class UserApplication {
  final UserConfigService _service =
      ServiceFactory.getService(ServiceType.userConfigService);

  Future getInfUser() async {
    UserConfigmodel userConfigmodel = await _service.getInfUserService();
    return userConfigmodel;
  }

  Future updateInfUser(Map<String, dynamic> value) async {
    UserDTO userDTO = UserDTO.fromJson(value);
    UserConfigmodel userConfigmodel =
        await _service.updateInfUserService(userDTO);
    return userConfigmodel;
  }

  Future createUser(Map<String, String> value) async {
    UserDTO userDTO = UserDTO.fromJson(value);
    return await _service.createUser(userDTO);
  }
}
