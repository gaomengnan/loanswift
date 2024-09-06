import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  //int _currentStep = 0;
  @override
  void initState() {
    super.initState();
    //_currentStep = 0;
  }

  @override
  Widget build(BuildContext context) {
    //return StepperExample();
    final currentStep = context.select((CertifiesBloc bloc) => bloc.state.cerfityStep);
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
              title: Text(S.current.emergency_contact),
              content: const BasicInformation(),
              isActive: currentStep.value >= 1,
            ),
            Step(
              title: Text(S.current.work_information),
              content: const BasicInformation(),
              isActive: currentStep.value >= 2,
            ),
            Step(
              title: Text(S.current.personal_information),
              content: const BasicInformation(),
              isActive: currentStep.value >= 3,
            ),
            //Step(
            //  title: const Text(''),
            //  content: const Text('This is the third step.'),
            //  isActive: _currentStep >= 2,
            //),
          ],
          currentStep: currentStep.value,
        ),
      ),
    );
  }
}
