import 'package:scaffold_project/Domain/DTO/ExpenseDTO.dart';
import 'package:scaffold_project/Domain/DTO/expense_v2.dart';

abstract class IExpensesRepository {
  // Insert, Update, delete, Get
  Future insertExpense(Expensev2DTO value);
  Future updateExpense(ExpenseDTO value);
  Future deleteExpense(String hash);
  Future getExpense();
}
