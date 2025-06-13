import 'package:flutter/material.dart';
import 'package:scaffold_project/Presentation/Components/Cards/card_configuration.dart';
import 'package:scaffold_project/Presentation/Pages/PagesConfigs/page_financial.dart';
import 'package:scaffold_project/Presentation/Pages/PagesConfigs/page_user.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';
import 'package:scaffold_project/Utils/size_config.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

class Configuration extends StatelessWidget {
  final String test = '';
  const Configuration({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: MQueryCustom(context, type: 'w'),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Configurações",
            textAlign: TextAlign.end,
            style: TextStyle(color: quartaryColro, fontSize: 23),
          ),
          const SizedBox(
            height: 20,
          ),
          const CircleAvatar(
            radius: 80,
          ),
          const SizedBox(
            height: 20,
          ),
          CardConfiguration(
            title: 'Usuário',
            subTitle: 'Nome, Sobrenome, data de nascimento, Email, senha, foto',
            onTap: () {
              NavigationPages.navigationToPageMaterial(
                  context, const PageUser());
            },
          ),
          CardConfiguration(
            title: 'Financeiro',
            subTitle: 'Cadastro de renda, limite de gastos mensais',
            onTap: () {
              NavigationPages.navigationToPageMaterial(
                  context, const PageFinancial());
            },
          ),
          CardConfiguration(
            title: 'Assinatura',
            subTitle:
                'Cadastro de cartão, Informações de pagamento, cancelamento de assinatura',
            onTap: () {},
          ),
        ],
      ),
    ));
  }
}
