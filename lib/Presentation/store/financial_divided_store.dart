import 'package:flutter/material.dart';
import 'package:scaffold_project/Controller/Financial/ExpensesInstallmentsApplication.dart';

ExpensesInstallmentsApplication _expensesInstallmentsApplication =
    ExpensesInstallmentsApplication();

class FinancialDividedViewModel extends ChangeNotifier {
  String descriptionSpend = '';
  double valueSpend = 0;
  int quantidadeParcela = 1;
  String data = '';

  // double parcela = 0; # é preciso passar essa informação

  setData(String value) {
    List<String> newValue = value.split('/');
    data = '${newValue[2]}-${newValue[1]}-${newValue[0]}';
  }

  setDescriptionSpend(String value) {
    descriptionSpend = value;
  }

  setValueSpend(String value) {
    valueSpend = double.parse(value);
  }

  setQuantidadeParcela(String value) {
    quantidadeParcela = int.parse(value);
  }

  Map<String, dynamic> formToJson() {
    Map<String, dynamic> json = {
      'id_user': 1,
      'id_category': 1,
      'date': data,
      'descricao_despesa': descriptionSpend,
      'valor_gasto': valueSpend,
      'quantidade_parcela': quantidadeParcela,
      'parcela': valueSpend / quantidadeParcela,
    };
    return json;
  }

  Future<void> submmit(BuildContext context) async {
    _expensesInstallmentsApplication
        .insertInstallments(formToJson())
        .then((response) => {})
        .catchError((error) => {});
  }
}
