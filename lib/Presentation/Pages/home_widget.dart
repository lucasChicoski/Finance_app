import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/ViewModel/financial_view_model.dart';
import 'package:scaffold_project/Presentation/Widgets/App_Bar/app_bar_custom.dart';
import 'package:scaffold_project/Presentation/Widgets/item_list/item_list.dart';

FinancialViewModel _financialViewModel = GetIt.I<FinancialViewModel>();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    _financialViewModel.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //..._financialViewModel.getListItens["widget"] as Widget
    constructList();
    return Column(
      children: [
        AppBarCustom(), //Mudar para dentro do construct list
        Expanded(
          child: Container(
            height: 100,
            // color: primaryColor,
            child: ListView(
              // children: [...constructList()],
              children:[ for (int i = 0; i < _financialViewModel.getListItens.length; i++) _financialViewModel.getListItens[i].item ],
            ),
          ),
        )
      ],
    );
  }
}
