import 'package:scaffold_project/Domain/DTO/finance_config_dto.dart';
import 'package:scaffold_project/Service/Configs/FinanceConfigService.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class FinanceApplication {
  Future saveFinanceConfig(FinanceConfigDTO value) async {
    FinanceConfigService financeConfigService =
        ServiceFactory.getService(ServiceType.financeConfigService);

    FinanceConfigDTO result =
        await financeConfigService.saveFinanceConfigService(value);

    return result;
  }

  Future<FinanceConfigDTO> getFinanceConfigInf() async {
    FinanceConfigService financeConfigService =
        ServiceFactory.getService(ServiceType.financeConfigService);

    FinanceConfigDTO result =
        await financeConfigService.getFinanceConfigService();

    return result;
  }
}
