import 'package:scaffold_project/Domain/DTO/expense_installment_dto.dart';
import 'package:scaffold_project/Service/ExpensesInstallmentsService.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class ExpensesInstallmentsApplication {
  Future insertInstallments(Map<String, dynamic> json) async {
    ExpenseInstallmentDTO expenseDTO = ExpenseInstallmentDTO.fromJson(json);

    ExpensesInstallmentsService expensesInstallmentsService =
        ServiceFactory.getService(ServiceType.expensesInstallmentsService);

    var result = await expensesInstallmentsService
        .insertExpensesInstallments(expenseDTO);

    ExpenseInstallmentDTO expenseInstallmentReturn =
        ExpenseInstallmentDTO.fromJson(result);

    return expenseInstallmentReturn;
  }

  Future<List<ExpenseInstallmentDTO>> getExpensesInstallments(int userId) async {
    ExpensesInstallmentsService expensesInstallmentsService =
        ServiceFactory.getService(ServiceType.expensesInstallmentsService);

    List<ExpenseInstallmentDTO> result =
        await expensesInstallmentsService.getExpensesInstallments(userId);

    return result;
  }
}
