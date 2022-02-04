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

  // Variáveis de apoio
  final DateTime firstDay = DateTime(2021, 1, 1);
  final DateTime _currentDateSystem = DateTime.now();

  @override
  Widget build(BuildContext context) {

    print(DateTime(2022,_currentDateSystem.month,0));

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
            firstDay: firstDay, 
            lastDay: DateTime.now(),
            calendarFormat: calendarFormat,
            rangeStartDay: initialRange,
            rangeEndDay: endRange,
            rangeSelectionMode: RangeSelectionMode.toggledOff,
            onRangeSelected: (DateTime? start, DateTime? end, DateTime focusedDay) {
              setState(() {

                print("Start - $start");
                print("End - $end");
                print("focusedDay - $focusedDay");
                print("selectedDay - $selectedDay");
                print("\n");

                // Mês anterior e pode selecionar apenas os últimos 5 dias úteis
                if(start != null && (_currentDateSystem.month - 1) == start.month) {

                  // O dia vai estar setado para o último dia do mês
                  DateTime lastDayFromPreviousMonth = DateTime(start.year, _currentDateSystem.month, 0);
                  DateTime fifthLastDayFromPreviousMonth = lastDayFromPreviousMonth.subtract(const Duration(days: 4));

                  if(start.isBefore(fifthLastDayFromPreviousMonth)) {
                    initialRange = null;
                    endRange = null;
                    return;
                  }
                }

                if(initialRange != null && endRange != null) {
                  initialRange = null;
                  endRange = null;
                }

                if(initialRange == null) {
                  initialRange = start;
                  return;
                }

                if(initialRange != null && start != null && start.isBefore(initialRange!)) {
                  initialRange = start;
                  endRange = null;
                  return;
                }

                if(initialRange != null) {
                  endRange = start;
                  return;
                }

                // initialRange = start;
                // endRange = end;

                
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
              ),
              rangeEndDecoration: BoxDecoration(
                color: Colors.green[300]!,
                shape: BoxShape.rectangle,
              ),
              rangeStartDecoration: BoxDecoration(
                color: Colors.orange[300]!,
                shape: BoxShape.rectangle,
              ),
              
            ),
          )
        ],
      )
    );
  }
}