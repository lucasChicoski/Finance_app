import 'package:flutter/material.dart';

class ConfigFinanceiroStore extends ChangeNotifier {
  double renda = 0;
  double guardaDinheiro = 0;
  double balance = 0;


  void setRenda(double value) {
    renda = value;
    notifyListeners();
  }

  void setGuardaDinheiro(double value) {
    guardaDinheiro = value;
    notifyListeners();
  }

  void setBalance(double value) {
    balance = value;
    notifyListeners();
  }


  Future submit() async  {
    
  }

}
