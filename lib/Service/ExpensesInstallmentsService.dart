import 'package:scaffold_project/Domain/DTO/ExpenseInstallmentDTO.dart';
import 'package:scaffold_project/Infra/Repositories/expense_installments/Expenses_installments_repositories.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class ExpensesInstallmentsService {
  Future insertExpensesInstallments(ExpenseInstallmentDTO value) async {
    ExpensesInstallmentsRepositories expensesInstallmentsRepositories =
        RepositoryFactory.getRepository(
            RepositoryType.expensesInstallmentsRepositories);

    await expensesInstallmentsRepositories.insertExpense(value);
  }

  Future<List<ExpenseInstallmentDTO>> getExpensesInstallments() async {
    List<ExpenseInstallmentDTO> listExpensesInstallments = [];

    ExpensesInstallmentsRepositories expensesInstallmentsRepositories =
        RepositoryFactory.getRepository(
            RepositoryType.expensesInstallmentsRepositories);

    var result = await expensesInstallmentsRepositories.getExpense();

    for (var element in result) {
      ExpenseInstallmentDTO item = ExpenseInstallmentDTO.fromJson(element);
      listExpensesInstallments.add(item);
    }

    return listExpensesInstallments;
  }
}