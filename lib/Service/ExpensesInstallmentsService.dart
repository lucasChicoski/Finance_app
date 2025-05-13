import 'package:scaffold_project/Domain/DTO/expense_installment_dto.dart';
import 'package:scaffold_project/Infra/Repositories/expense_installments/Expenses_installments_repositories.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class ExpensesInstallmentsService {
  Future insertExpensesInstallments(ExpenseInstallmentDTO value) async {
    ExpensesInstallmentsRepositories expensesInstallmentsRepositories =
        RepositoryFactory.getRepository(
            RepositoryType.expensesInstallmentsRepositories);

    var result = await expensesInstallmentsRepositories.insertExpense(value);
    return result;
  }

  Future<List<ExpenseInstallmentDTO>> getExpensesInstallments(int userId) async {
    List<ExpenseInstallmentDTO> listExpensesInstallments = [];

    ExpensesInstallmentsRepositories expensesInstallmentsRepositories =
        RepositoryFactory.getRepository(
            RepositoryType.expensesInstallmentsRepositories);

    var result = await expensesInstallmentsRepositories.getExpense(userId);

    for (var element in result) {
      ExpenseInstallmentDTO item = ExpenseInstallmentDTO.fromJson(element);
      listExpensesInstallments.add(item);
    }

    return listExpensesInstallments;
  }
}
