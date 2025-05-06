import 'package:flutter/material.dart';
import 'package:scaffold_project/Controller/Configs/UserApplication.dart';
import 'package:scaffold_project/Global/Enum/StatusText.dart';
import 'package:scaffold_project/Global/dio_response.dart';
import 'package:scaffold_project/shared/regex.dart';

class SiginStore extends ChangeNotifier {
  final UserApplication _userApplication = UserApplication();
  String nome = '';
  String sobrenome = '';
  String email = '';
  String cpf = '';
  String password = '';
  String repeatPassword = '';
  bool showPasswd = false;

  bool get validForm =>
      nome.isNotEmpty &&
      sobrenome.isNotEmpty &&
      email.isNotEmpty &&
      cpf.isNotEmpty &&
      password.isNotEmpty &&
      repeatPassword.isNotEmpty;

  dynamic get validPasswd =>
      password == repeatPassword || repeatPassword.isEmpty
          ? null
          : "Senhas diferentes";
  dynamic get validCPF =>
      cpf.length == 14 || cpf.isEmpty ? null : "CPF inválido";
  dynamic get validname =>
      nome.length >= 3 || nome.isEmpty ? null : "Nome inválido";
  dynamic get validSobrenome =>
      sobrenome.length >= 3 || sobrenome.isEmpty ? null : "Sobrenome inválido";
  dynamic get validEmail =>
      isValidEmail(email) || email.isEmpty ? null : "Email inválido";

  bool get validEmailBool => isValidEmail(email);

  setName(String value) {
    nome = value;
  }

  setSobrenome(String value) {
    sobrenome = value;
  }

  setEmail(String value) {
    email = value;
  }

  setCpf(String value) {
    cpf = value;
  }

  setPassword(String value) {
    password = value;
  }

  setRepeatPassword(String value) {
    repeatPassword = value;
  }

  handleSubmit() async {
    notifyListeners();

    if (validForm && repeatPassword == password && validEmailBool) {
      Map<String, String> newUser = {
        "nome": nome,
        "lastName": sobrenome,
        "email": email,
        "cpf": cpf,
        "passwd": password,
      };
      DioResponse response = await _userApplication.createUser(newUser);

      if (response.statusText == Statustext.SUCCESS.value) {
        print('teste');
      } else {}
    } else {
      print('Erro');
    }
  }

  disposeVariables() {
    nome = '';
    sobrenome = '';
    email = '';
    cpf = '';
    password = '';
    repeatPassword = '';
  }
}
