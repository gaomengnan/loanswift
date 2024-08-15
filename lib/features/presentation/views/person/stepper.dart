import 'package:flutter/material.dart';

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Example'),
      ),
      body: Stepper(
        type: StepperType.horizontal,

        currentStep: _currentStep,
        onStepTapped: (int step) {
          setState(() {
            _currentStep = step;
          });
        },
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        steps: [
          Step(
            title: const Text('Step 1'),
            content: const Text('This is the first step.'),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Step 2'),
            content: const Text('This is the second step.'),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Step 3'),
            content: const Text('This is the third step.'),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }
}
