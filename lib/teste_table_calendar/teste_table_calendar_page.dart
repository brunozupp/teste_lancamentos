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

  CalendarFormat calendarFormat = CalendarFormat.month;

  DateTime initialRange = DateTime.now();
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
              focusedDay: initialRange, 
              locale: "pt_BR",
              onPageChanged: (day) {

                if(day.month == _currentDateSystem.month && day.year == _currentDateSystem.year) {
                  initialRange = _currentDateSystem;
                } else {
                  initialRange = day;
                }

                endRange = null;

                setState(() {
                  
                });
              },
              calendarBuilders: CalendarBuilders<DateTime>(
                markerBuilder: (_,date,events) {

                  if(events.isNotEmpty) {
                    return Visibility(
                      visible: !isSameDay(date, initialRange),
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
              onDaySelected: (selectedDay, focusedDay) {

                print("\n");
                print("selectedDay = $selectedDay");
                print("focusedDay = $focusedDay");

                setState(() {

                  if(selectedDay.month != focusedDay.month) {
                    return;
                  }
                  
                  // Caso a data para selecionar esteja fora do range do mês atual ou do mês anterior, não executa nada
                  if (((_currentDateSystem.month - 1) != focusedDay.month && _currentDateSystem.month != focusedDay.month)) {
                    initialRange = focusedDay;
                    endRange = null;
                    return;
                  }

                  // Caso não seja o mesmo ano da data atual ou do mesmo mês, respeitando a  validação do mês anterior acima, vai limpar tudo
                  if ((focusedDay.year < _currentDateSystem.year) ||
                      _currentDateSystem.month - focusedDay.month > 1) {
                    initialRange = focusedDay;
                    endRange = null;
                    return;
                  }

                  // Se endRange != null
                  if(endRange != null) {
                    endRange = null;
                    initialRange = focusedDay;
                    return;
                  }

                  if (focusedDay.isBefore(initialRange)) {
                    initialRange = focusedDay;
                    endRange = null;
                    return;
                  }

                  if (focusedDay.month > initialRange.month) {
                    initialRange = focusedDay;
                    endRange = null;
                    return;
                  }

                  if(endRange == null) {
                    endRange = focusedDay;
                    return;
                  }

                });
              },
              currentDay: initialRange,
              selectedDayPredicate: (day) {
                return isSameDay(initialRange, day);
              },
              weekendDays: const [],
              onFormatChanged: (format) {
                setState(() {
                  calendarFormat = format;
                });
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                withinRangeDecoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                rangeEndDecoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                rangeStartDecoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                rangeHighlightColor: Colors.grey.withOpacity(0.2),
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