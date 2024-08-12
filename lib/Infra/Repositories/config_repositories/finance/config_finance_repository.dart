import 'package:scaffold_project/Domain/DTO/FinanceConfigDTO.dart';
import 'package:scaffold_project/Global/dio_instance.dart';
import 'package:scaffold_project/Infra/Repositories/config_repositories/finance/i_config_finance_repository.dart';
import 'package:sqflite/sqflite.dart';

class ConfigFinanceRepository implements IConfigFinanceRepository {
  late Database _database;

  ConfigFinanceRepository(Database database) {
    _database = database;
  }

  @override
  Future getConfigFinance() async {
    var result = await DioInstance.dio()
        .post('/get-finance-config', data: {"userId": 1});

    return result.data;
    // var result = await _database
    //     .rawQuery('SELECT * FROM configuracao_financeiro WHERE id = 1');
    // return result.first;
  }

  @override
  Future saveConfigFinance(FinanceConfigDTO financeConfig) async {
    await _database.rawUpdate(
      'UPDATE configuracao_financeiro SET renda = ?, guarde_dinheiro = ?, balance = ? WHERE id_usuario = ?',
      [financeConfig.renda, financeConfig.saveMoney, financeConfig.balance, 1],
    );

    var result = await _database
        .rawQuery('SELECT * FROM configuracao_financeiro WHERE id = 1');
    return result.first;
  }
}
