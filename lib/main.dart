import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Infra/DataBase/SqFlite/sqflite.dart';
// import 'package:scaffold_project/Presentation/ViewModel/financial_view_model.dart';
import 'package:scaffold_project/Presentation/ViewModel/navigation_view_model.dart';
import 'package:scaffold_project/Utils/Routers.dart';
import 'package:scaffold_project/Utils/preloader.dart';
// import 'package:scaffold_project/Utils/size_config.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';
import 'package:scaffold_project/Presentation/Widgets/Nav_Bottom/nav_bottom.dart';
import 'package:scaffold_project/Presentation/list_screen.dart';
import 'package:scaffold_project/setup_getit.dart';

NavigationViewModel _navigationViewModel = GetIt.I<NavigationViewModel>();
// FinancialViewModel _financialViewModel = GetIt.I<FinancialViewModel>();

//Não precisa caso for um banco externo.
SQFlite _sqFlite = GetIt.I<SQFlite>();

void main(List<String> args) async {
  setUpGetIt();
  runApp(const MainApp());

  //Não precisa caso for um banco externo.
  if (Platform.isAndroid || Platform.isIOS) {
    await _sqFlite.geLocationDataBase();
    await _sqFlite.openDataBase(_sqFlite.pathDatabase);
  }

  //Chamada do preloader
  await PreLoader.allCall();
  // await _sqFlite.deleteDataBase(_sqFlite.pathDatabase);
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  _MainAppState() {
    //Adicionando o primeiro mês
    // DateTime currentDate = Global.getDate();
    // _financialViewModel.setCurrentDate(Global.defineMonth(currentDate.month));
    // _financialViewModel.setTitleHeader(Global.defineMonth(currentDate.month));
  }

  @override
  void initState() {
    _navigationViewModel.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(bodyLarge: TextStyle(color: terciaryColor))),
      debugShowCheckedModeBanner: false,
      routes: listRouters,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: primaryColor,
        bottomNavigationBar: const NavBottom(),
        body: listScreen[_navigationViewModel.index],
        // listScreen[_navigationViewModel.index],
      ),
    );
  }
}
