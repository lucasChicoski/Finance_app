import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Aplication/Financial/ExpensesInstallmentsApplication.dart';
import 'package:scaffold_project/Domain/DTO/ExpenseInstallmentDTO.dart';
import 'package:scaffold_project/Presentation/ViewModel/financial_view_model.dart';
import 'package:scaffold_project/Presentation/Widgets/table/table_windget.dart';
import 'package:scaffold_project/Utils/functions_helpers.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';

FinancialViewModel _financialViewModel = GetIt.I<FinancialViewModel>();
ExpensesInstallmentsApplication _expensesInstallmentsApplication =
    ExpensesInstallmentsApplication();

class FinancialDividedViewModel extends ChangeNotifier {
  String description = '';
  double valueSpent = 0;
  int qParcela = 0;
  double valueParcela = 0;

  List<TableRow> listExpansive = [];

  setDescription(String value) {
    description = value;
  }

  setValueSpent(String value) {
    valueSpent =
        value.isNotEmpty ? double.parse(value.replaceAll(",", ".")) : 0;
  }

  setQParcela(String value) {
    qParcela = value.isNotEmpty ? int.parse(value.replaceAll(",", ".")) : 1;
  }

  setValueParcela(String value) {
    valueParcela =
        value.isNotEmpty ? double.parse(value.replaceAll(",", ".")) : 0;
  }

  addExpense(String description, double valueSpent, int qParcela,
      BuildContext context) async {
    String hash = Global.getHash();

    //Validação se o valor gasto e quantidade de parcela existe

    if (this.valueSpent < 1) {
      print('É preciso adicionar um valor gasto');
      return;
    }

    valueParcela = double.parse((valueSpent / qParcela).toStringAsFixed(2));

    //Gravar no banco
    try {
      Map<String, String> item = {
        "descricao_despesa": description,
        "valor_gasto": valueSpent.toString(),
        "prestacoes": valueParcela.toString(),
        "parcela": qParcela.toString()
      };

      await _expensesInstallmentsApplication.insertInstallments(item);
    } catch (e) {
      return;
    }

    listExpansive.add(
        RowOfTable(description, qParcela, valueParcela, valueSpent, hash)
            .row());

    for (var i = 1; i <= qParcela; i++) {
      await _financialViewModel.addExpense(
          'Despesa parcelada', '$description - Parcela $i', valueSpent, context,
          popContext: false,
          isDivided: true,
          qParcela: qParcela,
          valueParcela: valueParcela,
          configureMonth: true,
          month: i == 1 ? Global.getDate().month : Global.getDate().month + 1,
          addItemList: i == 0 ? true : false);
    }

    this.valueSpent = 0;

    notifyListeners();

    NavigationPages.pop(context);
  }

  loadTable(List<ExpenseInstallmentDTO> itens) {
    for (ExpenseInstallmentDTO element in itens) {
      listExpansive.add(RowOfTable(element.descricaoDespesa, element.qParcela,
              element.prestacoes, element.valorGasto, '')
          .row());
    }

    notifyListeners();
  }
}
