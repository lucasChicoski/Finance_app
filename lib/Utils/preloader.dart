import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Controller/Category.dart';
// import 'package:scaffold_project/Controller/Configs/FinanceApplication.dart';
import 'package:scaffold_project/Controller/Configs/UserApplication.dart';
// import 'package:scaffold_project/Controller/Financial/ExpensesInstallmentsApplication.dart';
// import 'package:scaffold_project/Controller/Financial/ExpensiveApplication.dart';
import 'package:scaffold_project/Domain/DTO/CategoryDTO.dart';
// import 'package:scaffold_project/Domain/DTO/expense_installment_dto.dart';
// import 'package:scaffold_project/Domain/DTO/FinanceConfigDTO.dart';
import 'package:scaffold_project/Domain/Models/UserConfigModel.dart';
import 'package:scaffold_project/Presentation/store/category_store.dart';
import 'package:scaffold_project/Presentation/store/config_user_store.dart';

ConfigUserViewModel _configUserViewModel = GetIt.I<ConfigUserViewModel>();
CategoryViewModel _categoryViewModel = GetIt.I<CategoryViewModel>();

class PreLoader {
  // ignore: slash_for_doc_comments
  /**
   * Obeter os dados iniciais do sistema
   * 
   * Busca em Aplication -> Service -> Repository
   */

  static Future getUserInf() async {
    UserApplication userApplication = UserApplication();
    UserConfigmodel userInf = await userApplication.getInfUser();

    _configUserViewModel.setBirthDate(userInf.birthDate ?? "");
    _configUserViewModel.setEmail(userInf.email ?? "");
    _configUserViewModel.setLastName(userInf.lastName ?? "");
    _configUserViewModel.setName(userInf.name ?? "");
    _configUserViewModel.setPhoneNumber(userInf.phoneNumber ?? "");
  }

  //Carregar a lista de despesas primeiramente e depois carregar as informações financeiras
  static Future getFinanceInf() async {
    // FinanceApplication financeApplication = FinanceApplication();
    // FinanceConfigDTO result = await financeApplication.getFinanceConfigInf();

    
  }

  static Future getExpenses() async {
    // ExpensiveApplication expensiveApplication = ExpensiveApplication();
    // List<Map> result = await expensiveApplication.getExpense();

    // _financialStore.loadList(result);
    //Trabalhar com a viewModel ou popular a lista.
  }

  static Future getExpsensesInstallments() async {
    // ExpensesInstallmentsApplication expenseInstallmenteApp =
    //     ExpensesInstallmentsApplication();

    //é necessario buscar no cache o id do usuário
    // List<ExpenseInstallmentDTO> result =
    //     await expenseInstallmenteApp.getExpensesInstallments(1);

    // _dividedViewModel.loadTable(result);
  }

  static Future getCategoryExpense() async {
    List<CategoryDTO> result = await CategoryAplication().getCategory();
    _categoryViewModel.setListCategories(result);
    print(_categoryViewModel.listCategories);
  }
  
  static Future allCall() async {
    await getUserInf();
    await getFinanceInf();
    await getExpenses();
    await getExpsensesInstallments();
    await getCategoryExpense();
  }
}
