import 'package:scaffold_project/Domain/DTO/expense_installment_dto.dart';

abstract class IExpensesInstallmentsRepository {
  // Insert, Update, delete, Get
  Future insertExpense(ExpenseInstallmentDTO value);
  Future updateExpense(ExpenseInstallmentDTO value);
  Future deleteExpense(String hash);
  Future getExpense(int userId);
}
