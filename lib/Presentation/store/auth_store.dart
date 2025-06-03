import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Controller/auth_app.dart';
import 'package:scaffold_project/Domain/DTO/AuthDTO.dart';
import 'package:scaffold_project/Domain/DTO/UserDTO.dart';
import 'package:scaffold_project/Global/Returns/ReturnService.dart';
import 'package:scaffold_project/Presentation/Pages/Home.dart';
import 'package:scaffold_project/Presentation/Widgets/alert/simple_toast.dart';
import 'package:scaffold_project/Presentation/store/config_financeiro_store.dart';
import 'package:scaffold_project/Presentation/store/list_expense_installments_store.dart';
import 'package:scaffold_project/Presentation/store/list_expense_store.dart';
import 'package:scaffold_project/Service/ExpensesInstallmentsService.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';

ListExpenseStore _listExpenseStore = GetIt.I<ListExpenseStore>();
ConfigFinanceiroStore _configFinanceiroStore = GetIt.I<ConfigFinanceiroStore>();
ListExpenseInstallmentsStore _listExpenseInstallmentsStore =
    GetIt.I<ListExpenseInstallmentsStore>();

class AuthStore extends ChangeNotifier {
  final _authC = AuthController();
  final _despesasParceladas = ExpensesInstallmentsService();
  late UserDTO user;

  String cpf = '127.312.277-10';
  String passwd = '123';

  Future submit(BuildContext context) async {
    final response =
        await _authC.login(AuthDTO(cpf: cpf, passwd: passwd)) as ReturnService;

    if (response.data != null) {
      final data = response.data as UserDTO;

      final despeasParceladas = await   _despesasParceladas.getExpensesInstallments(data.id!);
      _listExpenseInstallmentsStore.setListExpenseInstallments(despeasParceladas);


      user = response.data as UserDTO;

      _configFinanceiroStore.setBalance(user.config!.balance!);
      _configFinanceiroStore.setRenda(user.config!.renda!);
      _configFinanceiroStore.setGuardaDinheiro(user.config!.saveMoney!);

      _listExpenseStore.constructList(user.despesasAgrupadas ?? []);

      NavigationPages.navigationToPageMaterial(context, Home());
    } else {
      simpleToast(context, item: 'Erro ao efetuar login');
    }

    notifyListeners();
  }

  setCpf(String value) {
    cpf = value;
    notifyListeners();
  }

  setPasswd(String value) {
    passwd = value;
    notifyListeners();
  }
}
