import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/Components/Labels/TextLabel.dart';
import 'package:scaffold_project/Presentation/Components/chart/PizzaChart.dart';
import 'package:scaffold_project/Presentation/Components/spaces/Spaces.dart';
import 'package:scaffold_project/Presentation/ViewModel/chart/expense_chart_view_model.dart';
import 'package:scaffold_project/Presentation/ViewModel/financial_view_model.dart';
import 'package:scaffold_project/Utils/size_config.dart';

ExpenseChartViewModel _expenseChartViewModel = GetIt.I<ExpenseChartViewModel>();
FinancialViewModel _financialViewModel = GetIt.I<FinancialViewModel>();

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      appBar: AppBar(
        backgroundColor: Color(0xfff7f7f7),
        centerTitle: true,
        title: Text(
          'Estatísticas',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Color(0xff343434)),
        ),
      ),
      // backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Spaces(
                  height: 20,
                ),
                const Spaces(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Balanço total',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff343434)),
                      ),
                      Text(
                        '${_financialViewModel.balanceValue}',
                        style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff343434)),
                      ),
                    ],
                  ),
                ),
                const Spaces(
                  height: 20,
                ),
                Container(
                  width: MQueryCustom(context, type: 'w', porcent: 1),
                  height: 350,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffffffff),
                  ),
                  child: _expenseChartViewModel
                          .hasDataListDatagroupByCategoryExpense
                      ? PizzaChart(
                          data: _expenseChartViewModel
                              .listDatagroupByCategoryExpense,
                        )
                      : Textlabel(
                          text: 'Você não possu dados para o relatório!',
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//E conomize