
import 'package:scaffold_project/Domain/DTO/ChartFilterDTO.dart';
import 'package:scaffold_project/Domain/Models/charts/PieChartModel.dart';

import 'package:scaffold_project/Service/Charts/ExpensesQueriesService.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class ExpenseQueriesApplication {
  late ExpensesQueriesService _expensesQueriesService;

  ExpenseQueriesApplication(ExpensesQueriesService value) {
    _expensesQueriesService =
        ServiceFactory.getService(ServiceType.expenseQueriesService);
  }

  Future<List<PieChartModel>> groupByCategoryExpense(Map<String, dynamic> json) async {
    
    List<PieChartModel> result = await _expensesQueriesService.groupByCategoryExpense(ChartFilterDTO.fromJson(json));

    return result;
  }
}
