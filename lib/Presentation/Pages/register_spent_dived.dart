import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/Components/buttons/elevated_button_custom.dart';
import 'package:scaffold_project/Presentation/Components/text_input/text_input_custom.dart';
import 'package:scaffold_project/Presentation/ViewModel/financial_divided_view_model.dart';
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
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 20, top: 50),
          decoration: BoxDecoration(
            color: secundaryColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Registro de despesas parceladas",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextInputCustom(
                hint: 'Descrição',
                hintColor: Colors.white.withAlpha(100),
                digitInputUserColor: Colors.white,
                onChange: _financialDividedViewModel.setDescription,
              ),
              SizedBox(
                height: 10,
              ),
              TextInputCustom(
                  hint: 'Valor total da compra',
                  hintColor: Colors.white.withAlpha(100),
                  textType: TextInputType.number,
                  digitInputUserColor: Colors.white,
                  onChange: _financialDividedViewModel.setValueSpent),
              SizedBox(
                height: 10,
              ),
              TextInputCustom(
                  textType: TextInputType.number,
                  hint: 'Quantidade de prestações',
                  hintColor: Colors.white.withAlpha(100),
                  digitInputUserColor: Colors.white,
                  onChange: _financialDividedViewModel.setQParcela),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Flexible(
                    child: ElevatedButtonCustom(
                      label: 'Registrar',
                      onPressed: () {
                        _financialDividedViewModel.addExpense(
                            _financialDividedViewModel.description,
                            _financialDividedViewModel.valueSpent,
                            _financialDividedViewModel.qParcela,
                            context);
                      },
                    ),
                  ),
                  SizedBox(
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
