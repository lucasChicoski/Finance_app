import 'package:flutter/material.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: secundaryColor, borderRadius: BorderRadius.circular(15)),
      child: TableCalendar(
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: quartaryColro),
          weekendStyle: TextStyle(color: quartaryColro),
        ),
        headerStyle: HeaderStyle(
          titleTextStyle: TextStyle(color: quartaryColro),
          formatButtonTextStyle: TextStyle(color: quartaryColro),
          formatButtonVisible: false,
          leftChevronIcon: Icon(
            Icons.chevron_left_rounded,
            color: quartaryColro,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right_rounded,
            color: quartaryColro,
          ),
          titleCentered: true,
        ),
        calendarStyle: CalendarStyle(
          withinRangeTextStyle: TextStyle(color: quartaryColro),
          defaultTextStyle: TextStyle(color: quartaryColro),
          weekendTextStyle: TextStyle(color: quartaryColro),
        ),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
      ),
    );
  }
}
