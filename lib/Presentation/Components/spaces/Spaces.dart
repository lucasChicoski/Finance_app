import 'package:flutter/material.dart';

class Spaces extends StatelessWidget {
  final double? width;
  final double? height;
  const Spaces({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width ?? 20,
      height: height ?? 20,
    );
  }
}
