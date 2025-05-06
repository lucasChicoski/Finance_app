import 'package:scaffold_project/Domain/DTO/FinanceConfigDTO.dart';
import 'package:scaffold_project/Infra/Repositories/config_repositories/finance/config_finance_repository.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class FinanceConfigService {
  Future saveFinanceConfigService(FinanceConfigDTO value) async {
    ConfigFinanceRepository configFinanceRepository =
        RepositoryFactory.getRepository(RepositoryType.configFinanceRepository);

    var result = await configFinanceRepository.saveConfigFinance(value);

    FinanceConfigDTO financeConfigDTO = FinanceConfigDTO.fromJSON(result);

    return financeConfigDTO;
  }

  Future<FinanceConfigDTO> getFinanceConfigService() async {
    ConfigFinanceRepository configFinanceRepository =
        RepositoryFactory.getRepository(RepositoryType.configFinanceRepository);

    var result = await configFinanceRepository.getConfigFinance();

    FinanceConfigDTO financeConfigDTO = FinanceConfigDTO.fromJSON(result);

    return financeConfigDTO;
  }
}
