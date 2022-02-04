import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class TesteTableCalendarPage extends StatefulWidget {
  const TesteTableCalendarPage({ Key? key }) : super(key: key);

  @override
  State<TesteTableCalendarPage> createState() => _TesteTableCalendarPageState();
}

class _TesteTableCalendarPageState extends State<TesteTableCalendarPage> {

  // Variáveis de apoio
  final DateTime firstDay = DateTime(2021, 1, 1);
  final DateTime _currentDateSystem = DateTime.now();

  DateTime currentDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  DateTime? initialRange;
  DateTime? endRange;

  final List<DateTime> dates = [
    DateTime.now(),
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now().subtract(const Duration(days: 2)),
    DateTime.now().subtract(const Duration(days: 2)),
    DateTime.now().subtract(const Duration(days: 3)),
    DateTime.now().subtract(const Duration(days: 5)),
    DateTime.now().subtract(const Duration(days: 5)),
    DateTime.now().subtract(const Duration(days: 7)),
    DateTime.now().subtract(const Duration(days: 7)),
    DateTime.now().subtract(const Duration(days: 7)),
  ];

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
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10
            ),
            child: TableCalendar<DateTime>(
              focusedDay: currentDay, 
              locale: "pt_BR",
              onPageChanged: (day) {

                if(day.month == _currentDateSystem.month && day.year == _currentDateSystem.year) {
                  setState(() {
                    currentDay = _currentDateSystem;
                  });
                } else {
                  setState(() {
                    currentDay = day;
                  });
                }
              },
              calendarBuilders: CalendarBuilders<DateTime>(
                markerBuilder: (_,date,events) {

                  if(events.isNotEmpty) {
                    return Visibility(
                      visible: !isSameDay(date, _currentDateSystem) || !isSameDay(_currentDateSystem, currentDay),
                      child: Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[900],
                        ),
                      ),
                    );
                  }
                }
              ),
              eventLoader: (date) {
                var sameDay = dates.where((element) => isSameDay(element, date)).toList();
                return sameDay;
              },
              
              firstDay: firstDay, 
              lastDay: _currentDateSystem,
              calendarFormat: calendarFormat,
              rangeStartDay: initialRange,
              rangeEndDay: endRange,
              rangeSelectionMode: RangeSelectionMode.toggledOff,
              onRangeSelected: (DateTime? start, DateTime? end, DateTime focusedDay) {
                setState(() {

                  log("Start - $start");
                  log("End - $end");
                  log("focusedDay - $focusedDay");
                  log("selectedDay - $currentDay");
                  log("\n");

                  // Mês anterior e pode selecionar apenas os últimos 5 dias úteis
                  if(start != null && (_currentDateSystem.month - 1) == start.month) {

                    // O dia vai estar setado para o último dia do mês
                    DateTime lastDayFromPreviousMonth = DateTime(start.year, _currentDateSystem.month, 0);
                    DateTime fifthLastDayFromPreviousMonth = lastDayFromPreviousMonth.subtract(const Duration(days: 4));

                    DateTime.april;

                    log("lastDayFromPreviousMonth - $lastDayFromPreviousMonth");
                    log("fifthLastDayFromPreviousMonth - $fifthLastDayFromPreviousMonth");

                    if(start.isBefore(fifthLastDayFromPreviousMonth)) {
                      initialRange = null;
                      endRange = null;
                      return;
                    }
                  }
                  
                  // Caso não seja o mesmo ano da data atual ou do mesmo mês, respeitando a  validação do mês anterior acima, vai limpar tudo
                  if((start != null && start.year < _currentDateSystem.year) || _currentDateSystem.month - start!.month > 1) {
                    initialRange = null;
                    endRange = null;
                    return;
                  }
                  
                  if(initialRange != null && endRange != null) {
                    initialRange = null;
                    endRange = null;
                  }

                  if(initialRange == null) {
                    initialRange = start;
                    return;
                  }

                  if(initialRange != null && start.isBefore(initialRange!)) {
                    initialRange = start;
                    endRange = null;
                    return;
                  }

                  if(initialRange != null) {
                    endRange = start;
                    return;
                  }         
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                
                setState(() {
                  currentDay = focusedDay;
                });
              },
              currentDay: currentDay,
              selectedDayPredicate: (day) {
                return isSameDay(currentDay, day);
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
                withinRangeDecoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                rangeEndDecoration: BoxDecoration(
                  color: Colors.blue[300]!,
                  shape: BoxShape.circle,
                ),
                rangeStartDecoration: BoxDecoration(
                  color: Colors.blue[300]!,
                  shape: BoxShape.circle,
                ),
                
              ),
              availableCalendarFormats: const {
                CalendarFormat.month: 'Semanal',
                CalendarFormat.twoWeeks: 'Mês',
                CalendarFormat.week: '2 Semanas',
              },
              headerStyle: HeaderStyle(
                decoration: const BoxDecoration(
                  color: Colors.blue
                ),
                headerMargin: const EdgeInsets.only(
                  bottom: 10
                ),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
                titleCentered: false,
                rightChevronIcon: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                leftChevronIcon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                formatButtonTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),
                formatButtonDecoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                titleTextFormatter: (date, locale) {
                  var formatted = DateFormat.yMMMM(locale).format(date);

                  return formatted[0].toUpperCase() + formatted.substring(1);
                }
                //formatButtonVisible: false
              ),
            ),
          )
        ],
      )
    );
  }
}