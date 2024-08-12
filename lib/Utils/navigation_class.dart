import 'package:flutter/material.dart';

class NavigationPages extends ChangeNotifier {
  static navigationToPage(String value, BuildContext context) {
    Navigator.pushNamed(context, value);
  }

  static navigationToPageMaterial(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
