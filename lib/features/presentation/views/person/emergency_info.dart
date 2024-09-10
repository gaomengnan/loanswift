import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/core/constants/ui.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:loanswift/features/presentation/bloc/certify/certifies_bloc.dart';
import 'package:loanswift/features/presentation/views/person/build_form_item.dart';

class EmergencyInfo extends StatefulWidget {
  const EmergencyInfo({super.key});

  @override
  State<EmergencyInfo> createState() => _EmergencyInfoState();
}

class _EmergencyInfoState extends State<EmergencyInfo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<int, TextEditingController> _controllers = {};

  TextEditingController generateController(Info info) {
    final controller = TextEditingController();
    _controllers[info.certifyId] = controller;
    return controller;
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.forEach(
      (key, value) {
        value.dispose();
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CertifiesBloc, CertifiesState>(
        listener: (context, state) {
      if (state is CertifiesRequestState) {
        if (_formKey.currentState!.validate()) {
          context.read<CertifiesBloc>().add(CertifyStepContinue());
        }
      }
    }, builder: (context, state) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            ...state.emergencyInfo.map((e) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildFormItem(
                      info: e,
                      onChanged: (s) {
                        context.read<CertifiesBloc>().add(CertifyCommitEvent(
                            certifyId: e.certifyId, certifyResult: s));
                      },
                    ),
                    UI.kHeight10(),
                    const Divider(
                      color: Colors.black12,
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}
