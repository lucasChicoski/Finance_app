import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/store/auth_store.dart';
import 'package:scaffold_project/Presentation/store/category_store.dart';
import 'package:scaffold_project/Presentation/store/chart/expense_chart_store.dart';
import 'package:scaffold_project/Presentation/store/config_financeiro_store.dart';
import 'package:scaffold_project/Presentation/store/config_user_store.dart';
import 'package:scaffold_project/Presentation/store/expense_divided_store.dart';
import 'package:scaffold_project/Presentation/store/expense_store.dart';
import 'package:scaffold_project/Presentation/store/list_expense_installments_store.dart';
import 'package:scaffold_project/Presentation/store/list_expense_store.dart';
import 'package:scaffold_project/Presentation/store/navigation_store.dart';
import 'package:scaffold_project/Presentation/store/sigin_store.dart';
import 'package:scaffold_project/Presentation/store/update_expense_store.dart';

final getIt = GetIt.instance;

setUpGetIt() {
  getIt.registerSingleton<NavigationViewModel>(NavigationViewModel());
  getIt.registerSingleton<ExpenseStore>((ExpenseStore()));
  getIt.registerSingleton<FinancialDividedViewModel>(
      FinancialDividedViewModel());
  getIt.registerSingleton<ConfigUserViewModel>(ConfigUserViewModel());
  getIt.registerSingleton<CategoryViewModel>(CategoryViewModel()); //Refatorar para Store
  getIt.registerSingleton<ExpenseChartViewModel>(ExpenseChartViewModel());
  getIt.registerSingleton<SiginStore>(SiginStore());
  getIt.registerSingleton<AuthStore>(AuthStore());
  getIt.registerSingleton<ListExpenseStore>(ListExpenseStore());
  getIt.registerSingleton<ConfigFinanceiroStore>(ConfigFinanceiroStore());
  getIt.registerSingleton<ListExpenseInstallmentsStore>(ListExpenseInstallmentsStore()); //UpdateExpenseStore
  getIt.registerSingleton<UpdateExpenseStore>(UpdateExpenseStore());
}
