import 'package:flutter/material.dart';

class NavigationViewModel extends ChangeNotifier {
  NavigationViewModel();

  int index = 0;

  changeIndex(int index) {
    this.index = index;
    notifyListeners();
  }

  pushStack(BuildContext context, String namedRouter) {
    Navigator.pushNamed(context, namedRouter);
  }
}
