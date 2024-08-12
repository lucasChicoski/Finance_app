// import 'package:carteirinhaapp/View/Page/home_page.dart';
// import 'package:carteirinhaapp/View/Page/id_identification.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_project/Presentation/Pages/PagesConfigs/page_financial.dart';
import 'package:scaffold_project/Presentation/Pages/home_widget.dart';
import 'package:scaffold_project/Presentation/Pages/monthly_expenses.dart';
import 'package:scaffold_project/Presentation/Pages/register_spent_dived.dart';
// import '../View/Page/configuration_page.dart';

Map<String, WidgetBuilder> listRouters = {
  '/home': (context) => const Home(),
  '/monthlyexpenses': (context) => const MonthlyExpenses(),
  '/pagefinancial': (context) => const PageFinancial(),
  '/pagefinancialdividedoptions': (context) => const RegisterSpentDived()
  // '/carteirinha': (context) => const IDIdentification(),
  // '/configuration': (context) => const ConfigurationPage()
};
