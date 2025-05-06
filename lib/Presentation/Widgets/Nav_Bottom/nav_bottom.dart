import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/Components/icons/icon_nav_bottom.dart';
import 'package:scaffold_project/Presentation/store/navigation_store.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

NavigationViewModel _navigationViewModel = GetIt.I<NavigationViewModel>();

class NavBottom extends StatefulWidget {
  const NavBottom({super.key});

  @override
  State<NavBottom> createState() => NavBottomState();
}

class NavBottomState extends State<NavBottom> {
  double borderRadius = Platform.isAndroid ? 10 : 30;
  double marginBottom = Platform.isAndroid ? 10 : 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: terciaryColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: marginBottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconNavBottom(
            icon: Icons.home,
            color: secundaryColor,
            router: '',
            function: () {
              _navigationViewModel.changeIndex(0);
            },
          ),
          IconNavBottom(
            icon: Icons.table_chart_outlined,
            color: secundaryColor,
            router: '',
            function: () {
              _navigationViewModel.changeIndex(1);
            },
          ),
          IconNavBottom(
            icon: Icons.note_rounded,
            color: secundaryColor,
            router: '',
            function: () {
              // _navigationViewModel.changeIndex(1);
            },
          ),
          IconNavBottom(
            icon: Icons.settings_sharp,
            color: secundaryColor,
            router: '',
            function: (){
              _navigationViewModel.changeIndex(2);
            },
          ),
        ],
      ),
    );
  }
}
