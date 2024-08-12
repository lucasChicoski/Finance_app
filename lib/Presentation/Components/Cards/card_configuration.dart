import 'package:flutter/material.dart';
import 'package:scaffold_project/Utils/size_config.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

class CardConfiguration extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function()? onTap;

  const CardConfiguration(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:const BorderRadius.all(Radius.circular(10)),
      onTap: onTap,
      child: Container(
        width: MQueryCustom(context, type: 'w', porcent: 0.9),
        padding:const EdgeInsets.all(10),
        margin:const EdgeInsets.only(top: 5 , bottom: 5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: secundaryColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: quartaryColro,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: quartaryColro),
            )
          ],
        ),
      ),
    );
  }
}
