import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TesteTableCalendarPage extends StatefulWidget {
  const TesteTableCalendarPage({ Key? key }) : super(key: key);

  @override
  State<TesteTableCalendarPage> createState() => _TesteTableCalendarPageState();
}

class _TesteTableCalendarPageState extends State<TesteTableCalendarPage> {
  
  // DateTime selectedDay = DateTime.now();
  // DateTime focusedDay = DateTime.now();
  DateTime currentDay = DateTime.now().add(Duration(days: 90));
  CalendarFormat calendarFormat = CalendarFormat.month;

  DateTime? initialRange;
  DateTime? endRange;

  // Variáveis de apoio
  final DateTime firstDay = DateTime(2021, 1, 1);
  final DateTime _currentDateSystem = DateTime.now().add(Duration(days: 90));

  @override
  Widget build(BuildContext context) {

    print(_currentDateSystem);
    //print(DateTime(2022,_currentDateSystem.month,0));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Teste table_calendar",
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: currentDay, 

            onPageChanged: (day) {
              print("MUDOUUUU");

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
            firstDay: firstDay, 
            lastDay: _currentDateSystem,
            calendarFormat: calendarFormat,
            rangeStartDay: initialRange,
            rangeEndDay: endRange,
            rangeSelectionMode: RangeSelectionMode.toggledOff,
            onRangeSelected: (DateTime? start, DateTime? end, DateTime focusedDay) {
              setState(() {

                print("Start - $start");
                print("End - $end");
                print("focusedDay - $focusedDay");
                print("selectedDay - $currentDay");
                print("\n");

                // Mês anterior e pode selecionar apenas os últimos 5 dias úteis
                if(start != null && (_currentDateSystem.month - 1) == start.month) {

                  // O dia vai estar setado para o último dia do mês
                  DateTime lastDayFromPreviousMonth = DateTime(start.year, _currentDateSystem.month, 0);
                  DateTime fifthLastDayFromPreviousMonth = lastDayFromPreviousMonth.subtract(const Duration(days: 4));

                  DateTime.april;

                  print("lastDayFromPreviousMonth - $lastDayFromPreviousMonth");
                  print("fifthLastDayFromPreviousMonth - $fifthLastDayFromPreviousMonth");

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
                //this.selectedDay = selectedDay;
                //this.focusedDay = focusedDay;
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