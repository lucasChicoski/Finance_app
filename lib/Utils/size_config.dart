import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
double MQueryCustom(BuildContext context,
    {double porcent = 1, required String type}) {
  if (type == 'w') {
    return MediaQuery.of(context).size.width * porcent;
  } else if (type == 'h') {
    return MediaQuery.of(context).size.height * porcent;
  }
  return MediaQuery.of(context).size.width;
}

String BreakPoint(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width <= 480) {
    return 'phone';
  } else if (width > 481 && width <= 820) {
    return 'tablet';
  } else {
    return 'desktop';
  }
}
