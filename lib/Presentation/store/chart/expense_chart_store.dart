import 'package:flutter/foundation.dart';
import 'package:scaffold_project/Controller/Chart/expenses_queires/ExpenseQueries.dart';
import 'package:scaffold_project/Domain/DTO/ChartFilterDTO.dart';
import 'package:scaffold_project/Domain/Models/charts/PieChartModel.dart';
import 'package:scaffold_project/Service/Charts/ExpensesQueriesService.dart';
import 'package:scaffold_project/Utils/functions_helpers.dart';

ExpenseQueriesApplication _expenseQueriesApplication =
    ExpenseQueriesApplication(ExpensesQueriesService());

class ExpenseChartViewModel extends ChangeNotifier {
  List<PieChartModel> listDatagroupByCategoryExpense = [];

  Future groupByCategoryExpense({ChartFilterDTO? value}) async {
    Map<String, dynamic> json = {
      'user_id': 1,
      'month': value?.month ?? Global.getDate().month
    };

    List<PieChartModel> result =
        await _expenseQueriesApplication.groupByCategoryExpense(json);
    setListDatagroupByCategoryExpense(result);
  }

  setListDatagroupByCategoryExpense(List<PieChartModel> value) {
    listDatagroupByCategoryExpense = value;
    notifyListeners();
  }

  bool get hasDataListDatagroupByCategoryExpense  => listDatagroupByCategoryExpense.isNotEmpty;
}
