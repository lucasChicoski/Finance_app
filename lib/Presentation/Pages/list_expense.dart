import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Controller/Financial/ExpensiveApplication.dart';
import 'package:scaffold_project/Presentation/Widgets/App_Bar/app_bar_custom.dart';

import 'package:scaffold_project/Presentation/store/list_expense_store.dart';

ListExpenseStore _listExpenseStore = GetIt.I<ListExpenseStore>();
ExpensiveApplication _despesas = ExpensiveApplication();

class ExpenseList extends StatefulWidget {
  const ExpenseList({super.key});

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  void initState() {
    _listExpenseStore.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const AppBarCustom(),
            Expanded(
              child: SizedBox(
                height: 100,
                child: RefreshIndicator(
                  onRefresh: () async {
                    _despesas.getExpense().then((value) {
                      _listExpenseStore.constructList(value);
                    });
                  },
                  child: ListView.builder(
                    itemCount: _listExpenseStore.listExpense.length,
                    itemBuilder: (context, index) {
                      return _listExpenseStore.listExpense[index].widget;
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
