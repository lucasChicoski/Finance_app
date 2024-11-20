import 'package:flutter/material.dart';
import 'package:scaffold_project/Presentation/Components/Calendar/calendar_widget.dart';
import 'package:scaffold_project/Presentation/Components/buttons/elevated_button_custom.dart';
import 'package:scaffold_project/Presentation/Pages/register_spent_dived.dart';

import 'package:scaffold_project/Presentation/Widgets/table/table_windget.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

class MonthlyExpenses extends StatefulWidget {
  const MonthlyExpenses({super.key});

  @override
  State<MonthlyExpenses> createState() => _MonthlyExpensesState();
}

class _MonthlyExpensesState extends State<MonthlyExpenses> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: Align(
              alignment: Alignment.center,
              child: Text(
                "Despesas mensais",
                textAlign: TextAlign.end,
                style: TextStyle(color: quartaryColro),
              ))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: primaryColor,
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const CalendarWidget(),
                const SizedBox(
                  height: 15,
                ),
                const TableWidget(),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButtonCustom(
                    label: 'Cadastrar Despesa',
                    onPressed: () {
                      NavigationPages.navigationToPageMaterial(context, const RegisterSpentDived());
                    }),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
