import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Global/dio_instance.dart';
import 'package:scaffold_project/Infra/DataBase/SqFlite/sqflite.dart';
import 'package:scaffold_project/Infra/Repositories/category/CategoryRepository.dart';
import 'package:scaffold_project/Infra/Repositories/chart/expense_queries/ExpensesQueries..dart';
import 'package:scaffold_project/Infra/Repositories/config_repositories/finance/config_finance_repository.dart';
import 'package:scaffold_project/Infra/Repositories/config_repositories/user/config_user_repository.dart';
import 'package:scaffold_project/Infra/Repositories/expense_installments/Expenses_installments_repositories.dart';
import 'package:scaffold_project/Infra/Repositories/expenses_repositorie/ExpensesRepositorie.dart';
import 'package:scaffold_project/Service/CategoryService.dart';
import 'package:scaffold_project/Service/Charts/ExpensesQueriesService.dart';
import 'package:scaffold_project/Service/Configs/FinanceConfigService.dart';
import 'package:scaffold_project/Service/Configs/UserConfigService.dart';
import 'package:scaffold_project/Service/ExpensesInstallmentsService.dart';
import 'package:scaffold_project/Service/ExpensesService.dart';

SQFlite _sqFlite = GetIt.I<SQFlite>();

enum ServiceType {
  userConfigService,
  financeConfigService,
  expensesService,
  expensesInstallmentsService,
  categoryService,
  expenseQueriesService,
}

class ServiceFactory {
  static dynamic getService(ServiceType type) {
    switch (type) {
      case ServiceType.userConfigService:
        return UserConfigService();
      case ServiceType.financeConfigService:
        return FinanceConfigService();
      case ServiceType.expensesService:
        return ExpenseSservice();
      case ServiceType.expensesInstallmentsService:
        return ExpensesInstallmentsService();
      case ServiceType.categoryService:
        return CategoryService();
      case ServiceType.expenseQueriesService:
        return ExpensesQueriesService();
      default:
        throw Exception('Service type not supported');
    }
  }
}

enum RepositoryType {
  configUserRepository,
  configFinanceRepository,
  expensesRepositories,
  expensesInstallmentsRepositories,
  categoryRepository,
  expenseQueries,
}

class RepositoryFactory {
  static dynamic getRepository(RepositoryType type) {
    switch (type) {
      case RepositoryType.configUserRepository:
        return ConfigUserRepository(_sqFlite.getDataBase());
      case RepositoryType.configFinanceRepository:
        return ConfigFinanceRepository(_sqFlite.getDataBase());
      case RepositoryType.expensesRepositories:
        return ExpensesRepositorie(_sqFlite.getDataBase());
      case RepositoryType.expensesInstallmentsRepositories:
        return ExpensesInstallmentsRepositories(_sqFlite.getDataBase());
      case RepositoryType.categoryRepository:
        return Categoryrepository(DioInstance.dio());
      case RepositoryType.expenseQueries:
        return ExpensesQueriesRepository(DioInstance.dio());
      default:
        throw Exception('Repository type not supported');
    }
  }
}
