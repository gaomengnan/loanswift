import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/core/common/widgets/loading_page.dart';
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
      body: BlocConsumer<CertifiesBloc, CertifiesState>(
          listener: (context, state) {
        if (state is CertifiesFailure) {
          UI.showError(
            context,
            state.error.error,
          );
        }
        //if (state is CertifiesSuccess) {
        //print(state.data.identityInfo[0].toMap());
        //}
      }, builder: (context, state) {
        if (state is CertifiesSuccess) {
          return Stepper(
            physics: const ClampingScrollPhysics(),
            //controlsBuilder: (context, _) {
            //  return Container();
            //},
            onStepContinue: () {
              setState(() {
                _currentStep++;
              });
            },
            elevation: 0,
            type: StepperType.vertical,
            steps: [
              Step(
                title: Text(S.current.identity_authentication),
                content: IdentifyVerifyPage(
                  settings: state.data.identityInfo,
                ),
                isActive: _currentStep >= 0,
              ),
              Step(
                title: Text(S.current.emergency_contact),
                content: const BasicInformation(),
                isActive: _currentStep >= 1,
              ),
              Step(
                title: Text(S.current.work_information),
                content: const BasicInformation(),
                isActive: _currentStep >= 2,
              ),
              Step(
                title: Text(S.current.personal_information),
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
          );
        }

        return const LoadingPage();
      }),
    );
  }
}
