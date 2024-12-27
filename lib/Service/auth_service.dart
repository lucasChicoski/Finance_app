import 'package:scaffold_project/Domain/DTO/AuthDTO.dart';
import 'package:scaffold_project/Domain/DTO/ExpenseDTO.dart';
import 'package:scaffold_project/Domain/DTO/ExpenseInstallmentDTO.dart';
import 'package:scaffold_project/Domain/DTO/FinanceConfigDTO.dart';
import 'package:scaffold_project/Domain/DTO/UserDTO.dart';
import 'package:scaffold_project/Global/Returns/ReturnService.dart';
import 'package:scaffold_project/Global/dio_response.dart';
import 'package:scaffold_project/Global/interfaces/auth_intefaces.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class AuthService implements IAuthInterface {
  late IAuthInterface _repo;
  AuthService() {
    _repo = RepositoryFactory.getRepository(RepositoryType.authRepository);
  }

  @override
  Future<ReturnService> login(AuthDTO value) async {
    final result = await _repo.login(value) as DioResponse;

    if (result.statusCode == 200) {
      final user = UserDTO.fromJson(result.data);
      List<ExpenseDTO> despesas = [];
      List<ExpenseInstallmentDTO> despesasParceladas = [];
      final financeConfig =
          FinanceConfigDTO.fromJSON(result.data["finance_config"]);

      result.data["despesasParceladas"].forEach((element) {
        despesasParceladas.add(ExpenseInstallmentDTO.fromJson(element));
      });

      result.data["Despesas"].forEach((element) {
        despesas.add(ExpenseDTO.fromJSON(element));
      });

      user.setExpenses(despesas);
      user.setInstallments(despesasParceladas);
      user.setConfig(financeConfig);

      ReturnService<UserDTO> returnService =
          ReturnService<UserDTO>(data: user, message: result.message);

      return returnService;
    }

    ReturnService returnService =
        ReturnService(data: null, message: result.message);

    return returnService;
  }
}