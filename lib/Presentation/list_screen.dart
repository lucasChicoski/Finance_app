


import 'package:flutter/material.dart';
import 'package:scaffold_project/Presentation/Pages/configurations.dart';
import 'package:scaffold_project/Presentation/Pages/home_widget.dart';
import 'package:scaffold_project/Presentation/Pages/monthly_expenses.dart';
import 'package:scaffold_project/Presentation/Pages/register_spent_dived.dart';
import 'package:scaffold_project/Presentation/Pages/register_spent_not_divided.dart';

List<Widget> listScreen = [
 const Home(),
 const MonthlyExpenses(),
 const Configuration(),
 const RegisterSpentNotDivided(),
 const RegisterSpentDived()
];