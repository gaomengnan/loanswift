import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/app_text.dart';
import 'package:loanswift/features/presentation/bloc/certify/certifies_bloc.dart';
import 'package:loanswift/features/presentation/views/person/basic_information.dart';
import 'package:loanswift/features/presentation/views/person/emergency_info.dart';
import 'package:loanswift/features/presentation/views/person/identify_verify_page.dart';
import 'package:loanswift/features/presentation/views/person/job_info.dart';
import 'package:loanswift/theme/pallete.dart';

import '../../../../core/core.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  static const routerName = "/identity_vefification";

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final List<Widget> stepers = [
    const IdentifyVerifyPage(),
    const BasicInformation(),
    const EmergencyInfo(),
    const JobInfo(),
  ];

  final ScrollController _scrollController =
      ScrollController(); // ScrollController 控制滚动

  void _scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //return StepperExample();
    final currentStep =
        context.select((CertifiesBloc bloc) => bloc.state.cerfityStep);

    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 60.h,
        centerTitle: false,
        backgroundColor: Pallete.backgroundColor,
        title: Text(
          S.current.real_authentication,
          style: const TextStyle(
              //color: Pallete.whiteColor,
              ),
        ),

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: buildStepper(
            currentStep,
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

            if (state is CertifiesSettingsLoading) {
              UI.showLoading();
            }

            if (state is CertifiesSettingsLoadSuccess) {
              UI.hideLoading();
            }
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                children: [
                  stepers[currentStep.value],
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            context
                                .read<CertifiesBloc>()
                                .add(CertifyStepBack());
                            _scrollToTop();
                          },
                          child: RText(
                            text: S.current.previousStep,
                            color: Pallete.whiteColor,
                          ),
                        ),
                      ),
                      UI.kWidth10(),
                      if (!currentStep.isLastStep)
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              context
                                  .read<CertifiesBloc>()
                                  .add(CertifyStepRequest());

                              _scrollToTop();
                            },
                            child: RText(
                              text: S.current.nextStep,
                              color: Pallete.whiteColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStepper(StepperEnum currentStep) {
    return Container(
      color: Colors.grey.shade200,
      clipBehavior: Clip.none,
      child: EasyStepper(
        alignment: Alignment.center,
        lineStyle: LineStyle(
          lineLength: 70.w,
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
        showLoadingAnimation: true,
        stepRadius: 8,
        showStepBorder: false,
        steps: [
          EasyStep(
            customTitle: RText(text: S.current.identity_authentication),
            
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor:
                    currentStep.value >= 0 ? Colors.orange : Colors.white,
              ),
            ),
            //title: S.current.identity_authentication,
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor:
                    currentStep.value >= 1 ? Colors.orange : Colors.white,
              ),
            ),
            customTitle: RText(text: S.current.personal_information),
            topTitle: true,
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor:
                    currentStep.value >= 2 ? Colors.orange : Colors.white,
              ),
            ),
            customTitle: RText(text: S.current.emergency_contact),
            topTitle: true,
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor:
                    currentStep.value >= 3 ? Colors.orange : Colors.white,
              ),
            ),
            customTitle: RText(text: S.current.work_information)
          ),
        ],
        //onStepReached: (index) =>
        //    setState(() => activeStep = index),
      ),
    );
  }
}
