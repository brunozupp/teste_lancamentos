import 'package:flutter/material.dart';
import 'package:teste_lancamentos/time_picker_custom/field_timer.dart';

class TimePickerCustomPage extends StatelessWidget {

  const TimePickerCustomPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time Picker Custom'),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            FieldTimer(),
          ],
        ),
      ),
    );
  }
}