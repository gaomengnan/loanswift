import 'package:flutter/material.dart';
import 'package:loanswift/features/presentation/views/person/basic_information.dart';
import 'package:loanswift/features/presentation/views/person/idcard_upload_page.dart';
import 'package:loanswift/theme/pallete.dart';

import '../../../../core/core.dart';

class IdentityPage extends StatefulWidget {
  const IdentityPage({super.key});

  static const routerName = "/identity_vefification";

  @override
  State<IdentityPage> createState() => _IdentityPageState();
}

class _IdentityPageState extends State<IdentityPage> {
  final List<Widget> stepers = [
    const IDCardUploadPage(),
    const BasicInformation()
  ];

  int _currentStep = 0;
  @override
  void initState() {
    super.initState();
    _currentStep = 0;
  }

  @override
  Widget build(BuildContext context) {
    //return StepperExample();
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Pallete.backgroundColor,
        title: Text(
          S.current.real_authentication,
          style: const TextStyle(
              //color: Pallete.whiteColor,
              ),
        ),
      ),
      body: Stepper(
        controlsBuilder: (context, _) {
          return Container();
        },
        onStepContinue: () {
          setState(() {
            _currentStep++;
          });
        },
        elevation: 0,
        type: StepperType.vertical,
        steps: [
          Step(
            title: const Text('身份认证'),
            content: const IDCardUploadPage(),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('紧急联系人'),
            content: const IDCardUploadPage(),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('工作信息'),
            content: const BasicInformation(),
            isActive: _currentStep >= 2,
          ),
          Step(
            title: const Text('个人信息'),
            content: const BasicInformation(),
            isActive: _currentStep >= 3,
          ),
          //Step(
          //  title: const Text(''),
          //  content: const Text('This is the third step.'),
          //  isActive: _currentStep >= 2,
          //),
        ],
        currentStep: _currentStep,
      ),
    );
  }
}
