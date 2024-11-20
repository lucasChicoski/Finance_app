import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Infra/DataBase/SqFlite/sqflite.dart';
import 'package:scaffold_project/Presentation/store/category_store.dart';
import 'package:scaffold_project/Presentation/store/chart/expense_chart_store.dart';
import 'package:scaffold_project/Presentation/store/config_user_store.dart';
import 'package:scaffold_project/Presentation/store/financial_divided_store.dart';
import 'package:scaffold_project/Presentation/store/financial_store.dart';
import 'package:scaffold_project/Presentation/store/navigation_store.dart';
import 'package:scaffold_project/Presentation/store/sigin_store.dart';

// import 'View/Store/config_page.dart';

final getIt = GetIt.instance;

setUpGetIt() {
  getIt.registerSingleton<NavigationViewModel>(NavigationViewModel());
  getIt.registerSingleton<FinancialViewModel>(FinancialViewModel());
  getIt.registerSingleton<FinancialDividedViewModel>(FinancialDividedViewModel());
  getIt.registerSingleton<SQFlite>(SQFlite());
  getIt.registerSingleton<ConfigUserViewModel>(ConfigUserViewModel());
  getIt.registerSingleton<CategoryViewModel>(CategoryViewModel());
  getIt.registerSingleton<ExpenseChartViewModel>(ExpenseChartViewModel());
  getIt.registerSingleton<SiginStore>(SiginStore());
  // getIt.registerSingleton<ConfigPageStore>(ConfigPageStore());
}
