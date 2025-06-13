import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Domain/DTO/CategoryDTO.dart';
import 'package:scaffold_project/Presentation/Components/Calendar/native_calendar_widget.dart';
import 'package:scaffold_project/Presentation/Components/buttons/elevated_button_custom.dart';
import 'package:scaffold_project/Presentation/Components/drop_down/DropDownCustom.dart';
import 'package:scaffold_project/Presentation/Components/text_input/text_input_custom.dart';
import 'package:scaffold_project/Presentation/store/category_store.dart';
import 'package:scaffold_project/Presentation/store/expense_store.dart';
import 'package:scaffold_project/Utils/size_config.dart';

ExpenseStore _financialStore = GetIt.I<ExpenseStore>();
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
            child: SizedBox(
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
                  const SizedBox(
                    height: 10,
                  ),
                  TextInputCustom(
                    hint: "Tipo de despesa",
                    onChange: _financialStore.setTipoDespesa,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DatePickerExample(
                    onChange: _financialStore.setData,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextInputCustom(
                      hint: "Descrição",
                      onChange: _financialStore.setDescricao),
                  const SizedBox(
                    height: 10,
                  ),
                  TextInputCustom(
                      hint: "Valor gasto",
                      textType: TextInputType.number,
                      prefixText: "R\$ ",
                      onChange: _financialStore.setValorGasto),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButtonCustom(
                      label: "Registrar",
                      onPressed: () {
                        _financialStore.submmit(context);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
