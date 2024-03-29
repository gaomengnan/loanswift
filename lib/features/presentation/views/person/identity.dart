import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../core/core.dart';
import 'idcard_upload.dart';

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

          title: Text(
            S.current.real_authentication,
          ),

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(
              10.h,
            ),
            child: StepProgressIndicator(
              size: 10,
              totalSteps: 4,
              currentStep: 1,
              selectedColor: Pallete.primaryColor,
              roundedEdges: const Radius.circular(10).r,
              unselectedColor: Pallete.greyColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              UI.kHeight10(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ),
                child: const IDCardUpload(),
              ),
            ],
          ),
        ),
        // body: Stepper(
        //
        //   controlsBuilder: (context, _) {
        //     return Container();
        //   },
        //   onStepContinue: () {
        //     setState(() {
        //       currentStep++;
        //     });
        //   },
        //   elevation: 0,
        //   type: StepperType.horizontal,
        //   steps: steps,
        //   currentStep: currentStep,
        // ),
      ),
    );
  }
}
