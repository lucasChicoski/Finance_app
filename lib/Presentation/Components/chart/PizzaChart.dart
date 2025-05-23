import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:scaffold_project/Domain/Models/charts/PieChartModel.dart';

class PizzaChart extends StatefulWidget {
  final List<PieChartModel> data;

  const PizzaChart({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => PizzaChartState();
}

class PizzaChartState extends State<PizzaChart> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections(),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(widget.data.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 135.0 : 130.0;
      // final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: Color(int.parse(widget.data[i].color)),
        value: double.parse(widget.data[i].value),
        title: widget.data[i].title,
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
          shadows: shadows,
        ),
        // badgeWidget: _Badge(
        //   'assets/icons/ophthalmology-svgrepo-com.svg',
        //   size: widgetSize,
        //   borderColor: AppColors.contentColorBlack,
        // ),
        badgePositionPercentageOffset: .98,
      );

      // switch (i) {
      //   case 0:
      //     return PieChartSectionData(
      //       color: Colors.blue,
      //       value: 40,
      //       title: teste[i].label,
      //       radius: radius,
      //       titleStyle: TextStyle(
      //         fontSize: fontSize,
      //         fontWeight: FontWeight.bold,
      //         color: const Color(0xffffffff),
      //         shadows: shadows,
      //       ),
      //       // badgeWidget: _Badge(
      //       //   'assets/icons/ophthalmology-svgrepo-com.svg',
      //       //   size: widgetSize,
      //       //   borderColor: AppColors.contentColorBlack,
      //       // ),
      //       badgePositionPercentageOffset: .98,
      //     );
      //   case 1:
      //     return PieChartSectionData(
      //       color: Colors.yellow,
      //       value: 30,
      //       title: '',
      //       radius: radius,
      //       titleStyle: TextStyle(
      //         fontSize: fontSize,
      //         fontWeight: FontWeight.bold,
      //         color: const Color(0xffffffff),
      //         shadows: shadows,
      //       ),
      //       // badgeWidget: _Badge(
      //       //   'assets/icons/librarian-svgrepo-com.svg',
      //       //   size: widgetSize,
      //       //   borderColor: AppColors.contentColorBlack,
      //       // ),
      //       badgePositionPercentageOffset: .98,
      //     );
      //   case 2:
      //     return PieChartSectionData(
      //       color: Colors.purple,
      //       value: 16,
      //       title: '',
      //       radius: radius,
      //       titleStyle: TextStyle(
      //         fontSize: fontSize,
      //         fontWeight: FontWeight.bold,
      //         color: const Color(0xffffffff),
      //         shadows: shadows,
      //       ),
      //       // badgeWidget: _Badge(
      //       //   'assets/icons/fitness-svgrepo-com.svg',
      //       //   size: widgetSize,
      //       //   borderColor: AppColors.contentColorBlack,
      //       // ),
      //       badgePositionPercentageOffset: .98,
      //     );
      //   case 3:
      //     return PieChartSectionData(
      //       color: Colors.green,
      //       value: 15,
      //       title: '',
      //       radius: radius,
      //       titleStyle: TextStyle(
      //         fontSize: fontSize,
      //         fontWeight: FontWeight.bold,
      //         color: const Color(0xffffffff),
      //         shadows: shadows,
      //       ),
      //       // badgeWidget: _Badge(
      //       //   'assets/icons/worker-svgrepo-com.svg',
      //       //   size: widgetSize,
      //       //   borderColor: AppColors.contentColorBlack,
      //       // ),
      //       badgePositionPercentageOffset: .98,
      //     );
      //   default:
      //     throw Exception('Oh no');
      // }
    });
  }
}

// class _Badge extends StatelessWidget {
//   const _Badge(
//     this.svgAsset, {
//     required this.size,
//     required this.borderColor,
//   });
//   final String svgAsset;
//   final double size;
//   final Color borderColor;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: PieChart.defaultDuration,
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         shape: BoxShape.circle,
//         border: Border.all(
//           color: borderColor,
//           width: 2,
//         ),
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//             color: Colors.black.withValues(),
//             offset: const Offset(3, 3),
//             blurRadius: 3,
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(size * .15),
//       // child: Center(
//       //   child: SvgPicture.asset(
//       //     svgAsset,
//       //   ),
//       // ),
//     );
//   }
// }
