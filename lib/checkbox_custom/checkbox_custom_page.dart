import 'package:flutter/material.dart';
import 'package:teste_lancamentos/checkbox_custom/checkbox_component.dart';

class CheckboxCustomPage extends StatefulWidget {
  const CheckboxCustomPage({ Key? key }) : super(key: key);

  @override
  State<CheckboxCustomPage> createState() => _CheckboxCustomPageState();
}

class _CheckboxCustomPageState extends State<CheckboxCustomPage> {
  
  var x1 = false;
  var x2 = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkbox Custom"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            CheckboxComponent(
              description: "Testando componente true",
              isChecked: true,
              onChanged: (value) {},
            ),
            CheckboxComponent(
              description: "Testando componente false",
              isChecked: false,
              onChanged: (value) {},
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20
              ),
            ),
            CheckboxComponent(
              description: "Testando componente dsadsadsadsa wqewqewqe qdsadsa",
              isChecked: false,
              onChanged: (value) {},
              spaceBetweenIconAndDescription: 0,
            ),
          ],
        ),
      ),
    );
  }
}