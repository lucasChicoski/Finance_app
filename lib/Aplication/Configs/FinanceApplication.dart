import 'package:scaffold_project/Domain/DTO/FinanceConfigDTO.dart';
import 'package:scaffold_project/Service/Configs/FinanceConfigService.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class FinanceApplication {
  Future saveFinanceConfig(Map<String, dynamic> value) async {
    FinanceConfigService financeConfigService =
        ServiceFactory.getService(ServiceType.financeConfigService);

    FinanceConfigDTO financeConfigDTO = FinanceConfigDTO.fromJSON(value);

    FinanceConfigDTO result =
        await financeConfigService.saveFinanceConfigService(financeConfigDTO);

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
