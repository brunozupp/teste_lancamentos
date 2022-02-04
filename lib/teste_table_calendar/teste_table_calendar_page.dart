import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TesteTableCalendarPage extends StatefulWidget {
  const TesteTableCalendarPage({ Key? key }) : super(key: key);

  @override
  State<TesteTableCalendarPage> createState() => _TesteTableCalendarPageState();
}

class _TesteTableCalendarPageState extends State<TesteTableCalendarPage> {
  
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  DateTime? initialRange;
  DateTime? endRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Teste table_calendar",
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: focusedDay, 
            firstDay: DateTime.now().subtract(const Duration(days: 5)), 
            lastDay: DateTime.now().add(const Duration(days: 365)),
            calendarFormat: calendarFormat,
            rangeStartDay: initialRange,
            rangeEndDay: endRange,
            //rangeSelectionMode: RangeSelectionMode.toggledOn,
            onRangeSelected: (DateTime? start, DateTime? end, DateTime focusedDay) {
              setState(() {

                initialRange = start;
                endRange = end;

                print("Start - $start");
                print("End - $end");
                print("\n");
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              
              setState(() {
                this.selectedDay = selectedDay;
                this.focusedDay = focusedDay;
              });
            },
            currentDay: selectedDay,
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            weekendDays: const [],
            onFormatChanged: (format) {
              setState(() {
                calendarFormat = format;
              });
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              withinRangeDecoration: BoxDecoration(
                color: Colors.blue[300]!,
                shape: BoxShape.rectangle,
              )
              
            ),
          )
        ],
      )
    );
  }
}