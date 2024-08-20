import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Infra/DataBase/SqFlite/sqflite.dart';
import 'package:scaffold_project/Presentation/ViewModel/category_view_model.dart';
import 'package:scaffold_project/Presentation/ViewModel/config_user_view_model.dart';
import 'package:scaffold_project/Presentation/ViewModel/financial_divided_view_model.dart';
import 'package:scaffold_project/Presentation/ViewModel/financial_view_model.dart';
import 'package:scaffold_project/Presentation/ViewModel/navigation_view_model.dart';

// import 'View/Store/config_page.dart';

final getIt = GetIt.instance;

setUpGetIt() {
  getIt.registerSingleton<NavigationViewModel>(NavigationViewModel());
  getIt.registerSingleton<FinancialViewModel>(FinancialViewModel());
  getIt.registerSingleton<FinancialDividedViewModel>(FinancialDividedViewModel());
  getIt.registerSingleton<SQFlite>(SQFlite());
  getIt.registerSingleton<ConfigUserViewModel>(ConfigUserViewModel());
  getIt.registerSingleton<CategoryViewModel>(CategoryViewModel());
  // getIt.registerSingleton<ConfigPageStore>(ConfigPageStore());
}
