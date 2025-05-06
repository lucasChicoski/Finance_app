import 'package:scaffold_project/Domain/DTO/AuthDTO.dart';

abstract class IAuthInterface {
  Future login(AuthDTO value);
}
