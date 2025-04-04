import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/core/constants/ui.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:loanswift/features/presentation/bloc/certify/certifies_bloc.dart';
import 'package:loanswift/features/presentation/views/person/build_form_item.dart';

class BasicInformation extends StatefulWidget {
  final String productId;
  const BasicInformation({super.key, required this.productId});

  @override
  State<BasicInformation> createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
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
            ...state.getCurrentStepData().map((e) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildFormItem(
                      info: e,
                      //controller: generateController(e),
                      onChanged: (s) {
                        context.read<CertifiesBloc>().add(CertifyCommitEvent(
                            certifyId: e.certifyId, certifyResult: s));
                      },
                    ),
                    Ui.kHeight10(),
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
