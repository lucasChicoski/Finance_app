import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/store/financial_store.dart';
import 'package:scaffold_project/Presentation/Widgets/App_Bar/app_bar_custom.dart';
import 'package:scaffold_project/Presentation/Widgets/item_list/item_list.dart';

FinancialStore _financialStore = GetIt.I<FinancialStore>();

class ExpenseList extends StatefulWidget {
  const ExpenseList({super.key});

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  void initState() {
    _financialStore.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //..._financialStore.getListItens["widget"] as Widget
    constructList();
    return MaterialApp(
      home: Scaffold(
        
        body: Column(
          children: [
            const AppBarCustom(), //Mudar para dentro do construct list
            Expanded(
              child: SizedBox(
                height: 100,
                // color: primaryColor,
                child: RefreshIndicator(
                  onRefresh: () async {
                    print(
                        'Ao executar essa função, deverá recarregar os itens');
                  },
                  child: ListView(
                    // children: [...constructList()],
                    children: [
                      // for (int i = 0;
                      //     i < _financialStore.getListItens.length;
                      //     i++)
                      //   _financialStore.getListItens[i].item
                    ],
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
