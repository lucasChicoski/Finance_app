import 'package:flutter/material.dart';
import 'package:scaffold_project/Controller/Configs/FinanceApplication.dart';

FinanceApplication _financeApplication = FinanceApplication();

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

  Future getConfigFinance() async {
    var result = await _financeApplication.getFinanceConfigInf();
    
    renda = result.renda!;
    guardaDinheiro = result.saveMoney!;
    balance = result.balance!;

    notifyListeners();
  }

  Future submit() async  {
    
  }

}
