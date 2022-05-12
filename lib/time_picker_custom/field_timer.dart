import 'package:flutter/material.dart';

class FieldTimer extends StatefulWidget {
  const FieldTimer({Key? key}) : super(key: key);

  @override
  State<FieldTimer> createState() => _FieldTimerState();
}

class _FieldTimerState extends State<FieldTimer> {

  var mode = TimePickerEntryMode.dial;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: const InputDecoration(
        labelText: "Ínicio",
        border: OutlineInputBorder(),
      ),
      onTap: () {

        showTimePicker(
          context: context,
          initialTime: const TimeOfDay(hour: 10, minute: 30),
          helpText: "12/12/2022 - 28/12/2022",
          confirmText: "Salvar Horas",
          cancelText: "Cancelar",
          initialEntryMode: TimePickerEntryMode.dial,
          onEntryModeChanged: (value) {
            setState(() {
              mode = TimePickerEntryMode.dial;
            });
          },
          builder: (context, child) {
            print("BUILD $mode");
            return Theme(
              data: Theme.of(context).copyWith(
                timePickerTheme: _timePickerTheme,
                textButtonTheme: TextButtonThemeData(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => const Color(0xFF0069B3)),
                    foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                    overlayColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 9, 139, 231)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )),
                  ),
                ),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  child!,

                  // AnimatedPositioned(
                  //   duration: Duration(milliseconds: 200),
                  //   top: mode == TimePickerEntryMode.dial ? 95 : 200,
                  //   child: Container(
                  //     padding: const EdgeInsets.all(20),
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xFF0069B3),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: const Text(
                  //       "12/12/2022 - 28/12/2022",
                  //       style: TextStyle(
                  //         color: Colors.white
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
          }
        );
      },
    );
  }
}

var _timePickerTheme = TimePickerThemeData(
  backgroundColor: const Color(0xFFF4F6FA),
  hourMinuteShape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(
      color: Color(0xFF0086E4),
      width: 3,
    ),
  ),
  dayPeriodColor: const Color(0xFF0086E4),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(
      color: Color(0xFF0086E4),
      width: 3,
    ),
  ),
  dayPeriodTextColor: Colors.white,
  dayPeriodShape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(
      color: Colors.orange,
      width: 4,
    ),
  ),
  dayPeriodBorderSide: BorderSide(
      color: Color(0xFF0086E4),
      width: 3,
    ),
  hourMinuteColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected)
          ? const Color(0xFF0086E4)
          : Colors.white
  ),
  hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected) 
          ? Colors.white 
          : const Color(0xFF0086E4)
  ),
  dialHandColor: const Color(0xFF0086E4),
  dialBackgroundColor: const Color(0xFFE5E5E5),
  hourMinuteTextStyle: const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  ),
  dayPeriodTextStyle: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  ),
  helpTextStyle: const TextStyle(
    color: Color(0xFF0086E4),
    fontSize: 16,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Color(0xFF0086E4),
        width: 3,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Color(0xFF0086E4),
        width: 3,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Color(0xFF0086E4),
        width: 3,
      ),
    ),
    contentPadding: EdgeInsets.all(0),
  ),
  dialTextColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected) 
          ? Colors.white 
          : const Color(0xFF020202)
  ),
  entryModeIconColor: const Color(0xFF0086E4),
);
