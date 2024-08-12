import 'package:scaffold_project/Domain/DTO/ExpenseDTO.dart';
import 'package:scaffold_project/Infra/Repositories/expenses_repositorie/ExpensesRepositorie.dart';
import 'package:scaffold_project/Utils/IOC.dart';
import 'package:scaffold_project/Utils/functions_helpers.dart';

class ExpenseSservice {
  Future<ExpenseDTO> insertExpense(ExpenseDTO value) async {
    ExpensesRepositorie expenseRepository =
        RepositoryFactory.getRepository(RepositoryType.expensesRepositories);

    var result = await expenseRepository.insertExpense(value);
    return ExpenseDTO.fromJSON(result);
  }

  Future<List<Map<String, dynamic>>> getExpense() async {
    int month = 0;
    bool isFirstIteration = true;
    List<Map<String, dynamic>> listExpense = [];
    List<ExpenseDTO> listAux = [];
    List<ExpenseDTO> listPerMonth = [];

    ExpensesRepositorie expenseRepository =
        RepositoryFactory.getRepository(RepositoryType.expensesRepositories);

    var result = await expenseRepository.getExpense();

    for (var element in result) {
      ExpenseDTO expenseDTO = ExpenseDTO.fromJSON(element);
      listAux.add(expenseDTO);
    }

    //USAR ESTA ORDENAÇÃO
    listAux.sort((ExpenseDTO a, ExpenseDTO b) => b.month.compareTo(a.month));

    //Ser for apenas um item registrado
    if (listAux.length == 1) {
      listExpense.add({
        "monthReference": listAux[0].month,
        "month": Global.defineMonth(listAux[0].month),
        "itens": [listAux[0]]
      });
      return listExpense;
    }


    //Melhorar utilizando query para busca.
    //Agrupa os intens por mês
    for (var i = 0; i < listAux.length; i++) {
      if (isFirstIteration) {
        month = listAux[i].month;
        listPerMonth.add(listAux[i]);
        isFirstIteration = false;
      } else {
        if (listAux[i].month == month) {
          listPerMonth.add(listAux[i]);

          if ((i + 1) == listAux.length) {
            listExpense.add({
              "monthReference": listAux[i].month,
              "month": Global.defineMonth(listAux[i].month),
              "itens": listPerMonth
            });
          }
        } else {
          listExpense.add({
            "monthReference": listAux[i - 1].month,
            "month": Global.defineMonth(listAux[i - 1].month),
            "itens": listPerMonth
          });

          listPerMonth = [];
          month = listAux[i].month;
          listPerMonth.add(listAux[i]);

          if ((i + 1) == listAux.length) {
            listExpense.add({
              "monthReference": listAux[i].month,
              "month": Global.defineMonth(listAux[i].month),
              "itens": listPerMonth
            });
          }
        }
      }
    }

    return listExpense;
  }

  Future deleteExpense(String hash) async {
    ExpensesRepositorie expenseRepository =
        RepositoryFactory.getRepository(RepositoryType.expensesRepositories);

    return await expenseRepository.deleteExpense(hash);
  }
}
