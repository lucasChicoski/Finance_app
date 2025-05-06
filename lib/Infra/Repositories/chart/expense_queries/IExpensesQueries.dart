import 'package:dio/dio.dart';
import 'package:scaffold_project/Domain/DTO/ChartFilterDTO.dart';

abstract class IExpensesQueries {
  Dio? dio;
  Future groupByCategoryExpense(ChartFilterDTO value);
}
