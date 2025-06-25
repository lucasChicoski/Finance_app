import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/Components/Cards/card_inputs.dart';
import 'package:scaffold_project/Presentation/Components/buttons/elevated_button_custom.dart';
import 'package:scaffold_project/Presentation/store/config_financeiro_store.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';
import 'package:scaffold_project/Utils/size_config.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

ConfigFinanceiroStore _configFinanceiroStore = GetIt.I<ConfigFinanceiroStore>();


class PageFinancial extends StatefulWidget {
  const PageFinancial({super.key});

  @override
  State<PageFinancial> createState() => _PageFinancialState();
}

class _PageFinancialState extends State<PageFinancial> {
    final TextEditingController _controllerRenda = TextEditingController(text: _configFinanceiroStore.renda.toString());
    final TextEditingController _controllerSaveMoney = TextEditingController(text: _configFinanceiroStore.guardaDinheiro.toString());
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
                            conttroller: _controllerRenda,
                            onChange: _configFinanceiroStore.setRendaToUpdate,
                            label: "Renda",
                            hint: "Digite sua renda",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CardInput(
                            conttroller: _controllerSaveMoney,
                            onChange: _configFinanceiroStore
                                .setGuardarDinheiroToUpdate,
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
                        _configFinanceiroStore.updateConfig();
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
