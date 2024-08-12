import 'package:scaffold_project/Domain/DTO/ExpenseDTO.dart';

abstract class IExpensesRepository {
  // Insert, Update, delete, Get
  Future insertExpense(ExpenseDTO value);
  Future updateExpense(ExpenseDTO value);
  Future deleteExpense(String hash);
  Future getExpense();
}
