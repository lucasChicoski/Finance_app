import 'package:dio/src/dio.dart';
import 'package:scaffold_project/Domain/DTO/ChartFilterDTO.dart';
import 'package:scaffold_project/Infra/Repositories/chart/expense_queries/IExpensesQueries.dart';

class ExpensesQueriesRepository implements IExpensesQueries {
  @override
  Dio? dio;

  ExpensesQueriesRepository(this.dio);

  @override
  Future groupByCategoryExpense(ChartFilterDTO value) async {
    var result =
        await dio!.post('/group-by-category-expense', data: value.toJson());

    return result.data["data"];
  }
}
