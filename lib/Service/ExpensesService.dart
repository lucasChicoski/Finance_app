import 'package:scaffold_project/Domain/DTO/expense_v2.dart';
import 'package:scaffold_project/Infra/Repositories/expenses_repositorie/ExpensesRepositorie.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class ExpenseSservice {
  Future<Expensev2DTO> insertExpense(Expensev2DTO value) async {
    ExpensesRepositorie expenseRepository =
        RepositoryFactory.getRepository(RepositoryType.expensesRepositories);

    var result = await expenseRepository.insertExpense(value);
    return Expensev2DTO.fromJSON(result);
  }

  Future<List<dynamic>> getExpense() async {
    ExpensesRepositorie expenseRepository =
        RepositoryFactory.getRepository(RepositoryType.expensesRepositories);

    List<dynamic> result = await expenseRepository.getExpense(1);
    return result;
  }

  Future deleteExpense(String hash) async {
    ExpensesRepositorie expenseRepository =
        RepositoryFactory.getRepository(RepositoryType.expensesRepositories);

    return await expenseRepository.deleteExpense(hash);
  }
}
