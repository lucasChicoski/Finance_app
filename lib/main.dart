import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/Pages/login.dart';
import 'package:scaffold_project/Presentation/store/navigation_store.dart';
import 'package:scaffold_project/Utils/Routers.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';
import 'package:scaffold_project/setup_getit.dart';

NavigationViewModel _navigationViewModel = GetIt.I<NavigationViewModel>();

void main(List<String> args) async {
  setUpGetIt();
  runApp(const MainApp());

  // await PreLoader.allCall();
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
      home: const Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xffF5F5F5),
        // bottomNavigationBar: const NavBottom(),
        // body: listScreen[_navigationViewModel.index],
        body: LoginScreen(),
        // listScreen[_navigationViewModel.index],
      ),
    );
  }
}
