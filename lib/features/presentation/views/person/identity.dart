import 'package:flutter/material.dart';
import 'package:loanswift/features/presentation/views/person/basic_information.dart';
import 'package:loanswift/features/presentation/views/person/idcard_upload_page.dart';
import 'package:loanswift/theme/pallete.dart';

import '../../../../core/core.dart';

class Identity extends StatefulWidget {
  const Identity({super.key});

  static const routerName = "/identity_vefification";

  @override
  State<Identity> createState() => _IdentityState();
}

class _IdentityState extends State<Identity> {
  final List<Widget> stepers = [
    const IDCardUploadPage(),
    const BasicInformation()
  ];

  int _currentStep = 0;
  @override
    void initState() {
      super.initState();
      _currentStep = 1;
    }
  @override
  Widget build(BuildContext context) {
    //return StepperExample();
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
          //bottom: PreferredSize(
          //  preferredSize: Size.fromHeight(
          //    10.h,
          //    //kToolbarHeight,
          //  ),
          //  child: StepProgressIndicator(
          //    size: 6,
          //    totalSteps: 4,
          //    currentStep: currentStep + 1,
          //    selectedColor: Pallete.primaryColor,
          //    //roundedEdges: const Radius.circular(10).r,
          //    unselectedColor: Pallete.greyColor
          //    //selectedColor: Colors.yellow,
          //    //unselectedColor: Colors.cyan,
          //    //roundedEdges: Radius.circular(10),
          //    //selectedGradientColor: LinearGradient(
          //    //  begin: Alignment.topLeft,
          //    //  end: Alignment.bottomRight,
          //    //  colors: [Colors.yellowAccent, Colors.deepOrange],
          //    //),
          //    //unselectedGradientColor: LinearGradient(
          //    //  begin: Alignment.topLeft,
          //    //  end: Alignment.bottomRight,
          //    //  colors: [Colors.black, Colors.blue],
          //    //),
          //  ),
          //),
        ),
        //body: SingleChildScrollView(
        //  child: Column(
        //    children: [
        //      UI.kHeight10(),
        //      Padding(
        //        padding: EdgeInsets.symmetric(
        //          horizontal: 20.w,
        //          vertical: 10.h,
        //        ),
        //        child: stepers[currentStep + 1-1],
        //      ),
        //    ],
        //  ),
        //),
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
          type: StepperType.horizontal,
          steps: [
            Step(
              title: const Text(''),
              content: const IDCardUploadPage(),
              isActive: _currentStep >= 0,
            ),
            Step(
              title: const Text(''),
              content: const BasicInformation(),
              isActive: _currentStep >= 1,
            ),
            Step(
              title: const Text(''),
              content: const Text('This is the third step.'),
              isActive: _currentStep >= 2,
            ),
          ],
          currentStep: _currentStep,
        ),
      ),
    );
  }
}
