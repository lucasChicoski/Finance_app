import 'package:scaffold_project/Domain/DTO/UserDTO.dart';

abstract class IConfigUserRepository {
  Future createUser(UserDTO value);
  Future getInfUser(int id);
  Future updateInfUser(UserDTO userInf);
}
