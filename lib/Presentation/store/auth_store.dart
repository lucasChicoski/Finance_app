import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Controller/auth_app.dart';
import 'package:scaffold_project/Domain/DTO/AuthDTO.dart';
import 'package:scaffold_project/Domain/DTO/UserDTO.dart';
import 'package:scaffold_project/Global/Returns/ReturnService.dart';
import 'package:scaffold_project/Presentation/Pages/Home.dart';
import 'package:scaffold_project/Presentation/Widgets/alert/simple_toast.dart';
import 'package:scaffold_project/Presentation/store/list_expense_store.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';

ListExpenseStore _listExpenseStore = GetIt.I<ListExpenseStore>();

class AuthStore extends ChangeNotifier {
  final _authC = AuthController();
  late UserDTO user;

  String cpf = '127.312.277-10';
  String passwd = '123';

  Future submit(BuildContext context) async {
    final response = await _authC.login(AuthDTO(cpf: cpf, passwd: passwd)) as ReturnService ; 

    if (response.data != null) {
      user = response.data as UserDTO;
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
