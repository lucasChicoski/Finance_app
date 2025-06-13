import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/Components/Calendar/native_calendar_widget.dart';
import 'package:scaffold_project/Presentation/Components/buttons/elevated_button_custom.dart';
import 'package:scaffold_project/Presentation/Components/text_input/text_input_custom.dart';
import 'package:scaffold_project/Presentation/store/expense_divided_store.dart';

import 'package:scaffold_project/Utils/navigation_class.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

FinancialDividedViewModel _financialDividedViewModel =
    GetIt.I<FinancialDividedViewModel>();

class RegisterSpentDived extends StatelessWidget {
  const RegisterSpentDived({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 20, top: 50),
          decoration: BoxDecoration(
            color: secundaryColor,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Registro de despesas parceladas",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
              DatePickerExample(
                    onChange: _financialDividedViewModel.setData,
                  ),
              const SizedBox(
                height: 10,
              ),
              TextInputCustom(
                hint: 'Descrição',
                hintColor: Colors.white.withAlpha(100),
                digitInputUserColor: Colors.white,
                onChange: _financialDividedViewModel.setDescriptionSpend,
              ),
              const SizedBox(
                height: 10,
              ),
              TextInputCustom(
                  hint: 'Valor total da compra',
                  hintColor: Colors.white.withAlpha(100),
                  textType: TextInputType.number,
                  digitInputUserColor: Colors.white,
                  onChange: _financialDividedViewModel.setValueSpend),
              const SizedBox(
                height: 10,
              ),
              TextInputCustom(
                  textType: TextInputType.number,
                  hint: 'Quantidade de parcelas',
                  hintColor: Colors.white.withAlpha(100),
                  digitInputUserColor: Colors.white,
                  onChange: _financialDividedViewModel.setQuantidadeParcela),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Flexible(
                    child: ElevatedButtonCustom(
                      label: 'Registrar',
                      onPressed: () {
                        _financialDividedViewModel.submmit(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      child: ElevatedButtonCustom(
                    label: 'Cancelar',
                    onPressed: () {
                      NavigationPages.pop(context);
                    },
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
