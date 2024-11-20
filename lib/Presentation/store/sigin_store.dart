import 'package:flutter/material.dart';

class SiginStore extends ChangeNotifier {
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

  bool get validPasswd => password == repeatPassword;

  setName(String value) {
    nome = value;
    notifyListeners();
  }

  setSobrenome(String value) {
    sobrenome = value;
    notifyListeners();
  }

  setEmail(String value) {
    email = value;
    notifyListeners();
  }

  setCpf(String value) {
    cpf = value;
    notifyListeners();
  }

  setPassword(String value) {
    password = value;
    notifyListeners();
  }

  setRepeatPassword(String value) {
    repeatPassword = value;
    notifyListeners();
  }

  handleSubmit() {
    if (validForm && validPasswd) {
      print('Sucesso');
    } else {
      print('Erro');
    }
  }
}
