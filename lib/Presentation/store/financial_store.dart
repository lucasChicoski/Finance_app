import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Controller/Configs/FinanceApplication.dart';
import 'package:scaffold_project/Controller/Financial/ExpensiveApplication.dart';
import 'package:scaffold_project/Domain/DTO/ExpenseDTO.dart';
import 'package:scaffold_project/Presentation/store/category_store.dart';
import 'package:scaffold_project/Presentation/Widgets/item_list/item_list.dart';
import 'package:scaffold_project/Domain/Models/ListItemModel.dart';
import 'package:scaffold_project/Utils/functions_helpers.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';
import 'package:uuid/v4.dart';

FinanceApplication financeApplication = FinanceApplication();
ExpensiveApplication expensiveApplication = ExpensiveApplication();

CategoryViewModel _categoryViewModel = GetIt.I<CategoryViewModel>();

class FinancialStore extends ChangeNotifier {
  String currentDate = "";
  UuidV4 uuid = const UuidV4();

  //Configuração de renda
  double renda = 0;
  double saveMoney = 0; //Colocar um valor muito alto
  double balanceValue = 0;

  //Lista de itens cadastrados
  List<ListItemModel> listItens = [];

  //Lista de despesas cadastradas (Objetos)
  List<Map<String, dynamic>> despesasCadastradas = [];

  //Cadastro de gastos 1x
  String waySpend = "";
  String descriptionSpent = "";
  double valueSpent = 0;
  int categorySpent = 0;

  setCurrentDate(String value) {
    currentDate = value;
  }

  setRenda(String value) {
    renda = value.isNotEmpty ? double.parse(value.replaceAll(",", ".")) : 0;
  }

  setSaveMoney(String value) {
    saveMoney = value.isNotEmpty ? double.parse(value.replaceAll(",", ".")) : 0;
  }

  setWaySpent(String value) {
    waySpend = value;
  }

  setDescriptionSpent(String value) {
    descriptionSpent = value;
  }

  setValueSpent(String value) {
    valueSpent =
        value.isNotEmpty ? double.parse(value.replaceAll(",", ".")) : 0;
  }

  setBalance(double value) {
    balanceValue = value;
  }

  updateDespesasCadastradas(List value) {
    List<ExpenseDTO> currentDateExpenses = [];
    if (value.isEmpty) {
      return;
    }

    currentDateExpenses = value[0]["itens"];

    for (var element in currentDateExpenses) {
      Map<String, String> item = {
        "hash": element.hash,
        "valor_gasto": element.valorGasto.toString(),
        "month": element.month.toString(),
        "parcela": element.parcela.toString(),
        "prestacoes": element.prestacoes.toString(),
        "descriptionSpent": element.descricaoDespesa,
        "tipo_despesa": element.tipoDespesa,
        "date": element.date.toString(),
        "is_divided": element.isDivided.toString()
      };

      despesasCadastradas.add(item);
    }
  }

  //Adiciona o mês
  setTitleHeader(String value) {
    listItens.add(ListItemModel(TitleList(title: value), ""));
    notifyListeners();
  }

  Future addExpense(
    String waySpent,
    String description,
    double valueSpent,
    BuildContext context, {
    bool popContext = true,
    int qParcela = 0,
    double valueParcela = 0,
    bool isDivided = false,
    bool addItemList = true,
    int month = 0,
    int year = 0,
    int? expenseInstallmentId,
    //excluir posteriormente
    int iteratorParcela = -1,
  }) async {
    if (waySpent.isEmpty || description.isEmpty || valueSpent == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Por favor, insira todas as informações !'),
        ),
      );
      return;
    }

    //Cria uma hash para cada item
    String hash = uuid.generate();

    //Verificar o mês
    // final date = DateTime.now();

    //adiciona o widget

    if (addItemList) {
      listItens.insert(
          1,
          ListItemModel(
              ItemListWidget(
                  waySpent: waySpent,
                  descriptionSpent: description,
                  valueSpent: isDivided ? valueParcela : valueSpent,
                  id: hash),
              hash));
    }
    //Adiciona os valores para contabilizar.

    Map<String, String> item = {
      "hash": hash,
      "valor_gasto": valueSpent.toString(),
      "month": isDivided ? month.toString() : Global.getDate().month.toString(),
      "year": isDivided ? year.toString() : Global.getDate().year.toString(),
      "parcela": qParcela.toString(),
      "prestacoes": valueParcela.toString(),
      "descriptionSpent":
          descriptionSpent.isEmpty ? description : descriptionSpent,
      "tipo_despesa": waySpent,
      "date": Global.getDate().toString(),
      "is_divided": isDivided.toString(),
      "id_user": 1.toString(), //Utilizar padrão de cache.
      "id_despesas_parceladas": expenseInstallmentId.toString(),
      "id_category": _categoryViewModel.selectedCategory.toString()
    };

    try {
      await expensiveApplication.insertExpense(item);
    } catch (e) {
      return;
    }

    despesasCadastradas.add(item);

    if (addItemList && isDivided) {
      await calculateBalance(despesasCadastradas);
    }

    if (!isDivided) {
      await calculateBalance(despesasCadastradas);
    }

    setWaySpent("");
    setDescriptionSpent("");
    setValueSpent("");
    _categoryViewModel.setSelectedCategory(0);

    notifyListeners();

    if (popContext) {
      NavigationPages.pop(context);
    }
  }

  loadList(List<Map> itens) async {
    itens.sort((a, b) => b["monthReference"].compareTo(a["monthReference"]));

    for (var element in itens) {
      setTitleHeader(element["month"]);
      setCurrentDate(element["month"]);
      for (ExpenseDTO itenMonth in element["itens"]) {
        listItens.add(
          ListItemModel(
              ItemListWidget(
                  waySpent: itenMonth.tipoDespesa,
                  descriptionSpent: itenMonth.descricaoDespesa,
                  valueSpent: itenMonth.isDivided
                      ? itenMonth.prestacoes ?? 0
                      : itenMonth.valorGasto,
                  id: itenMonth.hash),
              itenMonth.hash),
        );
      }
    }

    //Se a lista não for vazia, utiliza os itens e faça o calculo
    if (itens.isNotEmpty) {
      List<ExpenseDTO> listItensOfExpenseDTO = itens[0]["itens"];
      updateDespesasCadastradas(itens);
      await calculateBalance(listItensOfExpenseDTO, saveConfig: false);
    } else {
      //Caso a lista for vazia, adicione apenas o mes atual na lista.
      DateTime currentDate = Global.getDate();
      setCurrentDate(Global.defineMonth(currentDate.month));
      setTitleHeader(Global.defineMonth(currentDate.month));
    }
  }

  Future calculateBalance(List despesas, {bool saveConfig = true}) async {
    double? valorGasto = 0;
    double sum = 0;
    if (despesas is List<ExpenseDTO>) {
      for (ExpenseDTO element in despesas) {
        valorGasto =
            element.isDivided ? element.prestacoes : element.valorGasto;

        sum = sum + valorGasto!;
      }
    } else {
      for (var element in despesas) {
        valorGasto = bool.parse(element["is_divided"])
            ? double.parse(element["prestacoes"])
            : double.parse(element["valor_gasto"]);
        sum = sum + valorGasto;
      }
    }

    setBalance(sum == 0 ? renda : renda - sum);

    if (saveConfig) {
      await financeApplication.saveFinanceConfig(getFinanceConfig());
    }

    notifyListeners();
  }

  Map<String, dynamic> getFinanceConfig() {
    return {
      "balance": balanceValue,
      "renda": renda,
      "guarde_dinheiro": saveMoney
    };
  }

  deleteExpense(String hash) {
    //remove do B.D
    try {
      expensiveApplication.deleteExpense(hash);
    } catch (e) {
      debugPrint('erro ao excluir item');
      return;
    }

    //Remove de uma das listas
    despesasCadastradas.removeWhere((element) => element["hash"] == hash);

    //remover da lista de widget
    listItens.removeWhere((element) => element.hash == hash);

    //Calcula o banlanço novamente
    calculateBalance(despesasCadastradas);
    notifyListeners();
  }

  List<ListItemModel> get getListItens => listItens;
  List<Map<String, dynamic>> get listValues => despesasCadastradas;
  get getRendaToString => renda > 0 ? renda.toString() : "";
  get getSaveMoneyToString => saveMoney > 0 ? saveMoney.toString() : "";
  get getBalance => balanceValue.toString();
  bool get showWarningSaveMoney =>
      balanceValue <= saveMoney && renda != 0 ? true : false;

  //Métodos de submmit
  submmit(String renda, String saveMoney) {}
}
