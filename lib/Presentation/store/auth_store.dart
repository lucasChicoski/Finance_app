import 'package:flutter/material.dart';
import 'package:scaffold_project/Controller/auth_app.dart';
import 'package:scaffold_project/Domain/DTO/AuthDTO.dart';
import 'package:scaffold_project/Domain/DTO/UserDTO.dart';
import 'package:scaffold_project/Global/Returns/ReturnService.dart';
import 'package:scaffold_project/Presentation/Pages/Home.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';

class AuthStore extends ChangeNotifier {
  final _authC = AuthController();
  late UserDTO user;

  String cpf = '';
  String passwd = '';

  Future submit(BuildContext context) async {
    final response = await _authC.login(AuthDTO(cpf: cpf, passwd: passwd))
        as ReturnService<UserDTO?>;

    if (response.data != null) {
      user = response.data!;
      NavigationPages.navigationToPageMaterial(context, Home());
    } else {
      //Mostra mensagem e printa erro na tela
      //Não deixapassar para proxima tela
    }

    notifyListeners();
  }

  setCpf(String value) {
    cpf = value;
    notifyListeners();
  }

  setPasswd(String value) {
    passwd = value;
    notifyListeners();
  }
}
