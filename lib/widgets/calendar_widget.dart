import 'package:flexible_calendar/flexible_calendar.dart';
import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget(
      {super.key, required this.deviceWidth, required this.widgetWidth});

  final double deviceWidth;
  final double widgetWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widgetWidth,
      //height: deviceWidth * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: FlexibleCalendarView(
        textPreMonthTitle: "Dec",
        decorationOfSelectedDay: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        colorDayInAnotherMonth: Colors.grey,
        borderBackgroundStartDay: BorderRadius.only(
            topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
        borderBackgroundEndDay: BorderRadius.only(
            topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
        isSelectedOnlyOneDay: false,
        colorOfDayInMonth: Colors.black,
        colorOfSelectedDay: Colors.purple,
        styleOfDay: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }
}
