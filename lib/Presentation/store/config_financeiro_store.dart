import 'package:flutter/material.dart';
import 'package:scaffold_project/Controller/Configs/FinanceApplication.dart';
import 'package:scaffold_project/Domain/DTO/finance_config_dto.dart';

FinanceApplication _financeApplication = FinanceApplication();

class ConfigFinanceiroStore extends ChangeNotifier {
  double renda = 0;
  double guardaDinheiro = 0;
  double balance = 0;

  double? rendaToUpdate;
  double? guardarDinheiroToUpdate;

  void setRendaToUpdate(String value) {
    rendaToUpdate = double.tryParse(value);
  }

  void setGuardarDinheiroToUpdate(String value) {
    guardarDinheiroToUpdate = double.tryParse(value);
  }

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

    renda = result.renda ?? 0;
    guardaDinheiro = result.saveMoney ?? 0;
    balance = result.balance ?? 0;

    notifyListeners();
  }

  Future updateConfig() async {
    Map<String, dynamic> val = {};
    rendaToUpdate != null ? val.addAll({"renda": rendaToUpdate}) : null;
    guardarDinheiroToUpdate != null
        ? val.addAll({"save_money": guardarDinheiroToUpdate})
        : null;

    FinanceConfigDTO value = FinanceConfigDTO.fromJSON(val);

    await _financeApplication.saveFinanceConfig(value);
    await getConfigFinance();

    rendaToUpdate = null;
    guardarDinheiroToUpdate = null;
  }
}
