import 'package:scaffold_project/Domain/DTO/ExpenseDTO.dart';
import 'package:scaffold_project/Service/ExpensesService.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class ExpensiveApplication {
  Future insertExpense(Map<String, String> json) async {
    ExpenseDTO financialNotDevidedDTO = ExpenseDTO.fromJSON(json);

    ExpenseSservice expenseSservice =
        await ServiceFactory.getService(ServiceType.expensesService);

    ExpenseDTO result =
        await expenseSservice.insertExpense(financialNotDevidedDTO);

    return result;
  }

  Future getExpense() async {
    ExpenseSservice expenseSservice =
        await ServiceFactory.getService(ServiceType.expensesService);

    List<Map> listExpense = await expenseSservice.getExpense();

    return listExpense;
  }

  Future deleteExpense(String hash) async {
    ExpenseSservice expenseSservice =
        await ServiceFactory.getService(ServiceType.expensesService);

    return await expenseSservice.deleteExpense(hash);
  }
}
