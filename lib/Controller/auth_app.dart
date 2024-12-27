import 'package:scaffold_project/Domain/DTO/AuthDTO.dart';
import 'package:scaffold_project/Global/Returns/ReturnService.dart';
import 'package:scaffold_project/Global/interfaces/auth_intefaces.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class AuthController implements IAuthInterface {
  late IAuthInterface _authInterface;

  AuthController() {
    _authInterface = ServiceFactory.getService(ServiceType.authService);
  }

  @override
  Future login(AuthDTO value) async {
    final response = await _authInterface.login(value) as ReturnService;
    return response;
  }
}
