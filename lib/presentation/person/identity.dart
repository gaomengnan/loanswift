import 'package:flutter/material.dart';
import 'package:loanswift/presentation/widgets/idcard_upload.dart';
import 'package:loanswift/theme/pallete.dart';

import '../../common/widgets/app_text.dart';

class Identity extends StatefulWidget {
  const Identity({super.key});

  static const routerName = "/identity_vefification";

  @override
  State<Identity> createState() => _IdentityState();
}

class _IdentityState extends State<Identity> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    final List<Step> steps = [
      Step(
        isActive: currentStep >= 0,
        title: const Text(''),
        content: const IDCardUpload(),
      ),
      Step(
        isActive: currentStep >= 1,
        title: const Text(''),
        content: AppText(
          text: '人脸采集',
          textAlign: TextAlign.start,
        ),
      ),
      Step(
        isActive: currentStep >= 2,
        title: const Text(''),
        content: AppText(
          text: '基础资料填写',
          textAlign: TextAlign.start,
        ),
      ),
    ];
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Pallete.backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          primary: Pallete.primaryColor,
          seedColor: Pallete.primaryColor,
        ),
      ),
      child: Scaffold(
        backgroundColor: Pallete.backgroundColor,
        appBar: AppBar(
          centerTitle: false,
          // elevation: 1,
          backgroundColor: Pallete.backgroundColor,

          title: const Text(
            "实名认证",
          ),
        ),
        body: Stepper(
          
          controlsBuilder: (context, _) {
            return Container();
          },
          onStepContinue: () {
            setState(() {
              currentStep++;
            });
          },
          elevation: 0,
          type: StepperType.horizontal,
          steps: steps,
          currentStep: currentStep,
        ),
      ),
    );
  }
}
