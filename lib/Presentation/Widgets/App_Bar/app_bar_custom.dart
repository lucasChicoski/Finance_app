import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Infra/DataBase/SqFlite/sqflite.dart';
import 'package:scaffold_project/Presentation/Components/buttons/outlined_button_custom.dart';
import 'package:scaffold_project/Presentation/Pages/register_spent_not_divided.dart';
import 'package:scaffold_project/Presentation/Pages/report.dart';
import 'package:scaffold_project/Presentation/store/chart/expense_chart_store.dart';
import 'package:scaffold_project/Presentation/store/config_financeiro_store.dart';
import 'package:scaffold_project/Presentation/store/expense_store.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';
import 'package:scaffold_project/Utils/size_config.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

ExpenseStore _financialStore = GetIt.I<ExpenseStore>();
ExpenseChartViewModel _expenseChartViewModel = GetIt.I<ExpenseChartViewModel>();
SQFlite sqFlite = GetIt.I<SQFlite>();
ConfigFinanceiroStore _configFinanceiroStore =
    GetIt.I<ConfigFinanceiroStore>();

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({super.key});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  void initState() {
    _financialStore.addListener(() {
      //Verifica se o widget está montado para dar um setState na página
      if (mounted) {
        setState(() {});
      }
    });
    _configFinanceiroStore.addListener(() {
      //Verifica se o widget está montado para dar um setState na página
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      width: MQueryCustom(context, type: 'w'),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                offset: Offset(0, 1),
                spreadRadius: 0,
                blurRadius: 10)
          ],
          color: secundaryColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Column(
        children: [
          Text('Renda',
              style: TextStyle(
                  color: quartaryColro,
                  fontWeight: FontWeight.w800,
                  fontSize: 25)),
          Text('R\$ ${_configFinanceiroStore.renda.toStringAsFixed(2)}',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: quartaryColro,
                  fontSize: 25,
                  letterSpacing: 0.1)),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                color: terciaryColor, borderRadius: BorderRadius.circular(15)),
            width: MQueryCustom(context, type: 'w', porcent: 0.8),
            height: MQueryCustom(context, type: 'h', porcent: 0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Balanço',
                    style: TextStyle(
                        color: secundaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 35)),
                Text('R\$ ${_configFinanceiroStore.balance.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: secundaryColor,
                        fontSize: 30,
                        letterSpacing: 0.1)),
                const SizedBox(
                  height: 15,
                ),
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: 1.0,
                  child: Visibility(
                      visible: false,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child:
                            const Text("Você ultrapassou sua cota de gastos no mês"),
                      )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlibedButtonCustom(
                label: 'Cadastrar gasto',
                size: 0.40,
                onPressed: () {
                  NavigationPages.navigationToPageMaterial(
                      context, const RegisterSpentNotDivided());
                },
              ),
              OutlibedButtonCustom(
                label: 'Relatório',
                size: 0.40,
                onPressed: () async {
                  await _expenseChartViewModel.groupByCategoryExpense();

                  NavigationPages.navigationToPageMaterial(
                      context, const ReportView());
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
