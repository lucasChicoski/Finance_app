import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Domain/DTO/CategoryDTO.dart';
import 'package:scaffold_project/Presentation/Components/buttons/elevated_button_custom.dart';
import 'package:scaffold_project/Presentation/Components/drop_down/DropDownCustom.dart';
import 'package:scaffold_project/Presentation/Components/text_input/text_input_custom.dart';
import 'package:scaffold_project/Presentation/ViewModel/category_view_model.dart';
import 'package:scaffold_project/Presentation/ViewModel/financial_view_model.dart';
import 'package:scaffold_project/Utils/size_config.dart';

FinancialViewModel _financialViewModel = GetIt.I<FinancialViewModel>();
CategoryViewModel _categoryViewModel = GetIt.I<CategoryViewModel>();

class RegisterSpentNotDivided extends StatelessWidget {
  const RegisterSpentNotDivided({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              width: MQueryCustom(context, type: "w", porcent: 0.9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropDownCustom(
                    listItens: CategoryDTO.toListDropMenu(
                        _categoryViewModel.listCategories),
                    onSelected: (value) =>
                        {_categoryViewModel.setSelectedCategory(value!)},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputCustom(
                    hint: "Tipo de despesa",
                    onChange: _financialViewModel.setWaySpent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputCustom(
                      hint: "Descrição",
                      onChange: _financialViewModel.setDescriptionSpent),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputCustom(
                      hint: "Valor gasto",
                      textType: TextInputType.number,
                      prefixText: "R\$ ",
                      onChange: _financialViewModel.setValueSpent),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButtonCustom(
                      label: "Registrar",
                      onPressed: () {
                        _financialViewModel.addExpense(
                            _financialViewModel.waySpend,
                            _financialViewModel.descriptionSpent,
                            _financialViewModel.valueSpent,
                            context);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
