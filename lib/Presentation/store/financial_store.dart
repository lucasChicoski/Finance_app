import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Controller/Configs/FinanceApplication.dart';
import 'package:scaffold_project/Controller/Financial/ExpensiveApplication.dart';
import 'package:scaffold_project/Domain/DTO/expense_v2.dart';
import 'package:scaffold_project/Presentation/Widgets/alert/simple_toast.dart';
import 'package:scaffold_project/Presentation/store/config_financeiro_store.dart';
import 'package:scaffold_project/Presentation/store/list_expense_store.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';
// import 'package:get_it/get_it.dart';

FinanceApplication financeApplication = FinanceApplication();
ExpensiveApplication expensiveApplication = ExpensiveApplication();

ListExpenseStore _listExpenseStore = GetIt.I<ListExpenseStore>();
ConfigFinanceiroStore _configFinanceiroStore = GetIt.I<ConfigFinanceiroStore>();

class FinancialStore extends ChangeNotifier {
  int idCategory = 1;
  String data = ''; //:"2025-05-05",
  String tipoDespesa = ''; //:"Teste",
  String descricao = ''; //:"Playstation 5",
  double valorGasto = 0; //:5000,
  bool isDivided = false;
  int quantidadeParcela = 1;
  double parcela = 0;
  int month = 0;
  int year = 0;

  setData(String value) {
    List<String> newValue = value.split('/');
    data = '${newValue[2]}-${newValue[1]}-${newValue[0]}';
    month = int.parse(newValue[1]);
    year = int.parse(newValue[2]);
  }

  setCategory(String value) {
    idCategory = int.parse(value);
  }

  setTipoDespesa(String value) {
    tipoDespesa = value;
  }

  setDescricao(String value) {
    descricao = value;
  }

  setValorGasto(String value) {
    valorGasto = double.parse(value);
    parcela = double.parse(value);
  }

  Map<String, dynamic> formToJson() {
    Map<String, dynamic> json = {
      'id_user': 1,
      'date': data,
      'id_category': idCategory,
      'tipo_despesa': tipoDespesa,
      'descricao_despesa': descricao,
      'valor_gasto': valorGasto,
      'is_divided': isDivided,
      'quantidade_parcela': quantidadeParcela,
      'parcela': parcela,
      'month': month,
      'year': year,
    };
    return json;
  }

  Future<void> submmit(BuildContext context) async {
    expensiveApplication.insertExpense(formToJson()).then((value) async {
      final response =
          await financeApplication.getFinanceConfigInf();

      _configFinanceiroStore.setBalance(response.balance!);
      _configFinanceiroStore.setRenda(response.renda!);
      _configFinanceiroStore.setGuardaDinheiro(response.saveMoney!);


      _listExpenseStore.addNewItemToList(value as Expensev2DTO);
      NavigationPages.pop(context);

      simpleToast(context, item: "Despesa cadastrada");
      notifyListeners();
    }).catchError((error) {
      simpleToast(context, item: "Erro ao cadastrar despesa");
    });
  }
}
