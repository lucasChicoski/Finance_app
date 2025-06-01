import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/Widgets/Nav_Bottom/nav_bottom.dart';
import 'package:scaffold_project/Presentation/list_screen.dart';
import 'package:scaffold_project/Presentation/store/navigation_store.dart';

NavigationViewModel _navigationViewModel = GetIt.I<NavigationViewModel>();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    _navigationViewModel.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => {
        print('Tentou voltar')
      },
      child: MaterialApp(
        home: Scaffold(
          bottomNavigationBar: const NavBottom(),
          body: listScreen[_navigationViewModel.index],
        ),
      ),
    );
  }
}
