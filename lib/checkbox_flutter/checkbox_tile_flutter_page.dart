import 'package:flutter/material.dart';

class CheckboxTileFlutterPage extends StatefulWidget {
  const CheckboxTileFlutterPage({ Key? key }) : super(key: key);

  @override
  State<CheckboxTileFlutterPage> createState() => _CheckboxTileFlutterPageState();
}

class _CheckboxTileFlutterPageState extends State<CheckboxTileFlutterPage> {
  
  var x1 = false;
  var x2 = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkbox Flutter"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              value: x1, 
              onChanged: (value) {
                setState(() {
                  x1 = value!;
                });
              },
              
              title: const Text(
                "Uma descrição aqui x1"
              ),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: x2, 
              onChanged: (value) {
                setState(() {
                  x2 = value!;
                });
              },
              
              title: const Text(
                "Uma descrição aqui x2"
              ),
            ),
          ],
        ),
      ),
    );
  }
}