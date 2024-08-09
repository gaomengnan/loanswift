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
          //backgroundColor: Pallete.primaryColor,
          title: Text(
            S.current.real_authentication,
            style: const TextStyle(
                //color: Pallete.whiteColor,
                ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(
              10.h,
              //kToolbarHeight,
            ),
            child: const StepProgressIndicator(
              size: 6,
              totalSteps: 4,
              currentStep: 1,
              selectedColor: Pallete.redDeepColor,
              //roundedEdges: const Radius.circular(10).r,
              unselectedColor: Pallete.greyColor
              //selectedColor: Colors.yellow,
              //unselectedColor: Colors.cyan,
              //roundedEdges: Radius.circular(10),
              //selectedGradientColor: LinearGradient(
              //  begin: Alignment.topLeft,
              //  end: Alignment.bottomRight,
              //  colors: [Colors.yellowAccent, Colors.deepOrange],
              //),
              //unselectedGradientColor: LinearGradient(
              //  begin: Alignment.topLeft,
              //  end: Alignment.bottomRight,
              //  colors: [Colors.black, Colors.blue],
              //),
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
