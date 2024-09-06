import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/features/presentation/bloc/certify/certifies_bloc.dart';
import 'package:loanswift/features/presentation/views/person/basic_information.dart';
import 'package:loanswift/features/presentation/views/person/identify_verify_page.dart';
import 'package:loanswift/theme/pallete.dart';

import '../../../../core/core.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  static const routerName = "/identity_vefification";

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  //final List<Widget> stepers = [
  //  const IdentifyVerifyPage(),
  //  const BasicInformation()
  //];

  int activeStep = 0;
  @override
  void initState() {
    super.initState();
    activeStep = 1;
  }

  @override
  Widget build(BuildContext context) {
    //return StepperExample();
    final currentStep =
        context.select((CertifiesBloc bloc) => bloc.state.cerfityStep);

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
      body: SafeArea(
        child: BlocListener<CertifiesBloc, CertifiesState>(
          listener: (context, state) {
            if (state is CertifiesSettingLoadFailure) {
              UI.showError(
                context,
                state.error.error,
              );
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.grey.shade200,
                  clipBehavior: Clip.none,
                  child: EasyStepper(
                    lineStyle: LineStyle(
                      lineLength: 60.w,
                      lineType: LineType.normal,
                      lineThickness: 3,
                      lineSpace: 1,
                      lineWidth: 10,
                      unreachedLineType: LineType.dashed,
                    ),
                    activeStep: currentStep.value,
                    activeStepTextColor: Colors.black87,
                    finishedStepTextColor: Colors.black87,
                    //activeStepIconColor: Pallete.primaryColor,
                    internalPadding: 0,
                    //showLoadingAnimation: false,
                    stepRadius: 8,
                    showStepBorder: false,
                    steps: [
                      EasyStep(
                        customStep: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: currentStep.value >= 0
                                ? Colors.orange
                                : Colors.white,
                          ),
                        ),
                        title: S.current.identity_authentication,
                      ),
                      EasyStep(
                        customStep: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: currentStep.value >= 1
                                ? Colors.orange
                                : Colors.white,
                          ),
                        ),
                        title: S.current.personal_information,
                        topTitle: true,
                      ),
                      EasyStep(
                        customStep: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: currentStep.value >= 2
                                ? Colors.orange
                                : Colors.white,
                          ),
                        ),
                        title: S.current.work_information,
                      ),
                      EasyStep(
                        customStep: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: currentStep.value >= 3
                                ? Colors.orange
                                : Colors.white,
                          ),
                        ),
                        title: S.current.emergency_contact,
                        topTitle: true,
                      ),
                    ],
                    //onStepReached: (index) =>
                    //    setState(() => activeStep = index),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: const IdentifyVerifyPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );

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
      body: BlocListener<CertifiesBloc, CertifiesState>(
        listener: (context, state) {
          if (state is CertifiesSettingLoadFailure) {
            UI.showError(
              context,
              state.error.error,
            );
          }
          //if (state is CertifiesSuccess) {
          //print(state.data.identityInfo[0].toMap());
          //}
        },
        child: Stepper(
          physics: const ClampingScrollPhysics(),
          onStepCancel: () {
            context.read<CertifiesBloc>().add(CertifyStepBack());
          },
          onStepContinue: () {
            context.read<CertifiesBloc>().add(CertifyStepRequest());
          },
          elevation: 0,
          type: StepperType.vertical,
          steps: [
            Step(
              title: Text(S.current.identity_authentication),
              content: const IdentifyVerifyPage(),
              isActive: currentStep.value >= 0,
            ),
            Step(
              title: Text(S.current.personal_information),
              content: const BasicInformation(),
              isActive: currentStep.value >= 1,
            ),
            Step(
              title: Text(S.current.work_information),
              content: const BasicInformation(),
              isActive: currentStep.value >= 2,
            ),
            Step(
              title: Text(S.current.emergency_contact),
              content: const BasicInformation(),
              isActive: currentStep.value >= 3,
            ),
          ],
          currentStep: currentStep.value,
        ),
      ),
    );
  }
}
