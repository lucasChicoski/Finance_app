import 'package:scaffold_project/Domain/DTO/expense_update_DTO.dart';
import 'package:scaffold_project/Domain/DTO/expense_v2.dart';
import 'package:scaffold_project/Service/ExpensesService.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class ExpensiveApplication {
  Future insertExpense(Map<String, dynamic> json) async {
    // ExpenseDTO financialNotDevidedDTO = ExpenseDTO.fromJSON(json);

    Expensev2DTO expenseV2 = Expensev2DTO.fromJSON(json);

    ExpenseSservice expenseSservice =
        await ServiceFactory.getService(ServiceType.expensesService);

    Expensev2DTO result =
        await expenseSservice.insertExpense(expenseV2); 

    return result;
  }

  Future getExpense() async {
    ExpenseSservice expenseSservice =
        await ServiceFactory.getService(ServiceType.expensesService);

    List<dynamic> listExpense = await expenseSservice.getExpense();

    return listExpense;
  }

  Future updateExpense(ExpenseUpdateDTO json) async {
    ExpenseSservice expenseSservice =
        await ServiceFactory.getService(ServiceType.expensesService);

    return await expenseSservice.updateExpense(json);
  }

  Future deleteExpense(String hash) async {
    ExpenseSservice expenseSservice =
        await ServiceFactory.getService(ServiceType.expensesService);

    return await expenseSservice.deleteExpense(hash);
  }
}
