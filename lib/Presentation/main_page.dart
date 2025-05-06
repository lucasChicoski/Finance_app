import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// import 'package:scaffold_project/Presentation/Pages/login.dart';
import 'package:scaffold_project/Presentation/store/navigation_store.dart';
import 'package:scaffold_project/Presentation/Widgets/Nav_Bottom/nav_bottom.dart';
import 'package:scaffold_project/Presentation/list_screen.dart';
import 'package:scaffold_project/Utils/Routers.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

NavigationViewModel _navigationViewModel = GetIt.I<NavigationViewModel>();

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    _navigationViewModel.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        // body: LoginScreen(),
        // listScreen[_navigationViewModel.index],
      ),
    );
  }
}
