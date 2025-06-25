import 'package:scaffold_project/Domain/DTO/finance_config_dto.dart';

abstract class IConfigFinanceRepository {
  Future getConfigFinance();
  Future saveConfigFinance(FinanceConfigDTO financeConfig);
}
