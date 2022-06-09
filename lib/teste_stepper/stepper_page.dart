import 'package:flutter/material.dart';
import 'package:teste_lancamentos/teste_stepper/stepper_custom.dart';
    
class StepperPage extends StatefulWidget {

  const StepperPage({ Key? key }) : super(key: key);

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Page'),
      ),
      body: StepperCustom(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepTapped: (step) => tapped(step),
        onStepContinue:  continued,
        onStepCancel: cancel,
        steps: <Step>[
          Step(
            title: const Text('Account'),
            content: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email Address'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
              ],
            ),
            isActive: _currentStep == 0,
          ),
          Step(
            title: const Text('Address'),
            content: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Home Address'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Postcode'),
                ),
              ],
            ),
            isActive: _currentStep == 1,
          ),
          Step(
            title: const Text('Mobile Number'),
            content: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Mobile Number'),
                ),
              ],
            ),
            isActive:_currentStep == 2,
          ),
        ],
      ),
    );
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ?
        setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
        setState(() => _currentStep -= 1) : null;
  }
}