import 'package:dio/dio.dart';
import 'package:scaffold_project/Domain/DTO/FinanceConfigDTO.dart';
import 'package:scaffold_project/Infra/Repositories/config_repositories/finance/i_config_finance_repository.dart';

class ConfigFinanceRepository implements IConfigFinanceRepository {
  late Dio _dio;

  ConfigFinanceRepository(Dio dio) {
    _dio = dio;
  }

  @override
  Future getConfigFinance() async {
    var result = await _dio.post('/get-finance-config', data: {"userId": 1});
    return result.data['data'];
  }

  @override
  Future saveConfigFinance(FinanceConfigDTO financeConfig) async {
    //Implementar salvar financeiro
    var result = await _dio.post('/update-finance-config', data: financeConfig.toJSON());
    result.data;
    return FinanceConfigDTO(balance: 0, renda: 0, saveMoney: 0).toJSON();
  }
}
