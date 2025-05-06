import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/Components/Cards/card_inputs.dart';
import 'package:scaffold_project/Presentation/Components/buttons/elevated_button_custom.dart';
import 'package:scaffold_project/Presentation/store/financial_store.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';
import 'package:scaffold_project/Utils/size_config.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

FinancialStore _financialStore = GetIt.I<FinancialStore>();

class PageFinancial extends StatelessWidget {
  const PageFinancial({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: MQueryCustom(context, type: "w", porcent: 0.9),
              child: Column(
                children: [
                  Flexible(
                      flex: 10,
                      child: Column(
                        children: [
                          Text(
                            "Configurações",
                            textAlign: TextAlign.end,
                            style:
                                TextStyle(color: quartaryColro, fontSize: 23),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CardInput(
                            // conttroller: TextEditingController(
                            //     text: _financialStore.getRendaToString),
                            onChange: (value) {},
                            label: "Renda",
                            hint: "Digite sua renda",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CardInput(
                            // conttroller: TextEditingController(
                            //     text: _financialStore.getSaveMoneyToString),
                            onChange:(value) {},
                            label: "Guarde seu dinheiro",
                            hint: "Quanto deseja guardar por mês",
                          ),
                        ],
                      )),
                  Flexible(
                    flex: 1,
                    child: ElevatedButtonCustom(
                      label: "Salvar",
                      onPressed: () {
                        // _financialStore.calculateBalance(_financialStore.listValues);
                        NavigationPages.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
