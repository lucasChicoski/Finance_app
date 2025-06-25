import 'package:scaffold_project/Domain/DTO/AuthDTO.dart';
import 'package:scaffold_project/Domain/DTO/finance_config_dto.dart';
import 'package:scaffold_project/Domain/DTO/UserDTO.dart';
import 'package:scaffold_project/Global/Returns/ReturnService.dart';
import 'package:scaffold_project/Global/dio_response.dart';
import 'package:scaffold_project/Global/interfaces/auth_intefaces.dart';
import 'package:scaffold_project/Infra/Repositories/expenses_repositorie/IExpensesRepository.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class AuthService implements IAuthInterface {
  late IAuthInterface _repo;
  late IExpensesRepository _repoExpenses;
  AuthService() {
    _repo = RepositoryFactory.getRepository(RepositoryType.authRepository);
    _repoExpenses =
        RepositoryFactory.getRepository(RepositoryType.expensesRepositories);
  }

  @override
  Future<ReturnService> login(AuthDTO value) async {
    final result = await _repo.login(value) as DioResponse;

    if (result.statusCode == 200) {
      final listExpenseResult =
          await _repoExpenses.getExpense(result.data["id"]);

      final user = UserDTO.fromJson(result.data);
      final financeConfig =
          FinanceConfigDTO.fromJSON(result.data["finance_config"]);

      user.setConfig(financeConfig);
      user.setDespesasAgrupadas(listExpenseResult);
      
      ReturnService<UserDTO?> returnService = ReturnService<UserDTO?>(
          data: user, message: result.message, statusCode: result.statusCode);

      return returnService;
    }

    ReturnService<UserDTO?> returnService = ReturnService<UserDTO?>(
        data: null, message: result.message, statusCode: result.statusCode);

    return returnService;
  }
}
