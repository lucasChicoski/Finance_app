import 'package:flutter/material.dart';
import 'package:scaffold_project/Controller/Configs/UserApplication.dart';

class ConfigUserViewModel extends ChangeNotifier {
  //Atributes
  String name = '';
  String lastName = '';
  String birthDate = '';
  String email = '';
  String phoneNumber = '';

  //Setters

  setName(String value) {
    name = value;
  }

  setLastName(String value) {
    lastName = value;
  }

  setBirthDate(String value) {
    birthDate = value;
  }

  setEmail(String value) {
    email = value;
  }

  setPhoneNumber(String value) {
    phoneNumber = value;
  }

  //Actions

  Map<String, dynamic> getJsonUserConfig() {
    return {
      "nome": name,
      "lastName": lastName,
      "birthDate": birthDate,
      "email": email,
      "phoneNumber": phoneNumber,
    };
  }

  Future submmit(Map<String, dynamic> value) async {
    //Chamada do application;
    UserApplication userApplication = UserApplication();
    await userApplication.updateInfUser(value);
  }
}
