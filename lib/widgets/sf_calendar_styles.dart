import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


MonthViewSettings monthViewSettings(BuildContext context) {
  return MonthViewSettings(
    monthCellStyle: MonthCellStyle(
      textStyle: TextStyle(
        fontSize: fontSize14,
        color: Theme.of(context).brightness == Brightness.dark
            ? white
            : Colors.black,
      ),
    ),
    dayFormat: 'EEE',
    showTrailingAndLeadingDates: false,
  );
}

CalendarHeaderStyle calendarHeaderStyle(BuildContext context,
    {FontWeight fontWeight = FontWeight.bold}) {
  return CalendarHeaderStyle(
      textAlign: TextAlign.center,
      textStyle: TextStyle(
        fontWeight: fontWeight,
        color: Theme.of(context).brightness == Brightness.dark
            ? white
            : Colors.black,
      ));
}

ViewHeaderStyle viewHeaderStyle(BuildContext context) {
  return ViewHeaderStyle(
      dayTextStyle: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: fontSize12,
    color:
        Theme.of(context).brightness == Brightness.dark ? white : Colors.black,
  ));
}
