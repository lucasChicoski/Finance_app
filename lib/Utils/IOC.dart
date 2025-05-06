import 'package:scaffold_project/Global/dio_instance.dart';
import 'package:scaffold_project/Infra/Repositories/AuthRepository.dart';
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
import 'package:scaffold_project/Service/auth_service.dart';

// SQFlite _sqFlite = GetIt.I<SQFlite>();

enum ServiceType {
  userConfigService,
  financeConfigService,
  expensesService,
  expensesInstallmentsService,
  categoryService,
  expenseQueriesService,
  authService
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
      case ServiceType.authService:
        return AuthService();
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
  authRepository
}

class RepositoryFactory {
  static dynamic getRepository(RepositoryType type) {
    switch (type) {
      case RepositoryType.configUserRepository:
        return ConfigUserRepository(DioInstance.dio());
      case RepositoryType.configFinanceRepository:
        return ConfigFinanceRepository(DioInstance.dio());
      case RepositoryType.expensesRepositories:
        return ExpensesRepositorie(DioInstance.dio());
      case RepositoryType.expensesInstallmentsRepositories:
        return ExpensesInstallmentsRepositories(DioInstance.dio());
      case RepositoryType.categoryRepository:
        return Categoryrepository(DioInstance.dio());
      case RepositoryType.expenseQueries:
        return ExpensesQueriesRepository(DioInstance.dio());
      case RepositoryType.authRepository:
        return Authrepository(DioInstance.dio());
      default:
        throw Exception('Repository type not supported');
    }
  }
}
