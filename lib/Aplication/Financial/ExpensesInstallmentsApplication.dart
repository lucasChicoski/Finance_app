import 'package:scaffold_project/Domain/DTO/ExpenseInstallmentDTO.dart';
import 'package:scaffold_project/Service/ExpensesInstallmentsService.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class ExpensesInstallmentsApplication {
  Future insertInstallments(Map<String, String> json) async {
    ExpenseInstallmentDTO expenseDTO = ExpenseInstallmentDTO.fromJson(json);

    ExpensesInstallmentsService expensesInstallmentsService =
        ServiceFactory.getService(ServiceType.expensesInstallmentsService);

    await expensesInstallmentsService.insertExpensesInstallments(expenseDTO);
  }

  Future<List<ExpenseInstallmentDTO>> getExpensesInstallments() async {
    ExpensesInstallmentsService expensesInstallmentsService =
        ServiceFactory.getService(ServiceType.expensesInstallmentsService);

    List<ExpenseInstallmentDTO> result =
        await expensesInstallmentsService.getExpensesInstallments();

    return result;
  }
}