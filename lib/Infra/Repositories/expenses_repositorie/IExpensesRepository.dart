import 'package:scaffold_project/Domain/DTO/expense_update_dto.dart';
import 'package:scaffold_project/Domain/DTO/expense_v2.dart';

abstract class IExpensesRepository {
  // Insert, Update, delete, Get
  Future insertExpense(Expensev2DTO value);
  Future updateExpense(ExpenseUpdateDTO value);
  Future deleteExpense(String hash);
  Future getExpense(int id);
}
