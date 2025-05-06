import 'package:scaffold_project/Domain/DTO/ChartFilterDTO.dart';
import 'package:scaffold_project/Domain/Models/charts/PieChartModel.dart';
import 'package:scaffold_project/Infra/Repositories/chart/expense_queries/ExpensesQueries..dart';
import 'package:scaffold_project/Utils/IOC.dart';

class ExpensesQueriesService {
  late ExpensesQueriesRepository categoryRepo;

  ExpensesQueriesService() {
    categoryRepo =
        RepositoryFactory.getRepository(RepositoryType.expenseQueries);
  }

  Future<List<PieChartModel>> groupByCategoryExpense(
      ChartFilterDTO value) async {
    List result = await categoryRepo.groupByCategoryExpense(value);
    List<PieChartModel> data = [];
    for (var element in result) {
      data.add(PieChartModel(
          value: element["total_gasto"].toString(),
          title: element["category_label"],
          color: element['colors']));
    }

    return data;
  }
}
