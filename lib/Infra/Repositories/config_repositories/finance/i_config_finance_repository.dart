import 'package:scaffold_project/Domain/DTO/FinanceConfigDTO.dart';

abstract class IConfigFinanceRepository {
  Future getConfigFinance();
  Future saveConfigFinance(FinanceConfigDTO financeConfig);
}
