import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liveness_detection/liveness_detection.dart';
import 'package:loanswift/core/utils.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:loanswift/features/domain/usecases/common/ocr.dart';
import 'package:loanswift/features/presentation/bloc/certify/certifies_bloc.dart';
import 'package:loanswift/features/presentation/views/person/build_form_item.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/core.dart';

class IdentifyVerifyPage extends StatefulWidget {
  //final List<Info> settings;
  const IdentifyVerifyPage({
    super.key,
    //required this.settings,
  });

  @override
  State<IdentifyVerifyPage> createState() => _IdentifyVerifyPageState();
}

class _IdentifyVerifyPageState extends State<IdentifyVerifyPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //late String imagez = Assets.idcardFront;
  //late String imagef = Assets.idcardReverse;

  final faceRect = LivenessDetection();

  List<String> ocrFields = ['name', 'id_number', 'sex'];

  int tapIndex = 0;

  final Map<String, TextEditingController> _controllers = {};

  TextEditingController? generateController(Info info) {
    if (ocrFields.contains(info.certifyCode)) {
      var controller = _controllers[info.certifyCode];
      controller = TextEditingController();
      _controllers[info.certifyCode] = controller;
      return controller;
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controllers.forEach(
      (key, value) {
        value.dispose();
      },
    );
    super.dispose();
  }

  void setOcrRelateField(List<Info> identifyInfo, Info info, String name,
      String id, String gender) {
    final nameController = _controllers['name'];
    final idController = _controllers['id_number'];
    final genderController = _controllers['sex'];

    if (nameController != null) {
      nameController.text = name.toString();
    }

    if (idController != null) {
      idController.text = id.toString();
    }

    if (genderController != null) {
      genderController.text = gender.toString();
    }
  }

  void commitCertify(List<Info> identifyInfo, Info info, String name, String id,
      String gender) {
    if (name.isNotEmpty) {
      final Info nameCertify =
          identifyInfo.firstWhere((item) => item.certifyCode == 'name');

      context.read<CertifiesBloc>().add(CertifyCommitEvent(
          certifyId: nameCertify.certifyId, certifyResult: name.toString()));
    }

    if (id.isNotEmpty) {
      final Info idCertify =
          identifyInfo.firstWhere((item) => item.certifyCode == 'id_number');
      context.read<CertifiesBloc>().add(CertifyCommitEvent(
          certifyId: idCertify.certifyId, certifyResult: id.toString()));
    }

    if (gender.isNotEmpty) {
      final Info genderCertify =
          identifyInfo.firstWhere((item) => item.certifyCode == 'sex');

      context.read<CertifiesBloc>().add(CertifyCommitEvent(
          certifyId: genderCertify.certifyId,
          certifyResult: gender.toString()));
    }
  }

  void onChanged(List<Info> identifyInfo, Info info, String s) async {
    /*  增加 OCR 图片识别逻辑  */

    // 使用 认证项 certify_id  = 2

    if (info.certifyId == 2) {
      if (s.isEmpty) {
        setOcrRelateField(identifyInfo, info, "", "", "");
        return;
      }

      final ocrUsecase = sl<Ocr>();

      UI.showLoading();

      final resp = await ocrUsecase.call(OcrParams(objectKey: s));

      resp.fold((l) => UI.showError(context, l.message), (r) {
        UI.hideLoading();
        final entity = r['message'] ?? {};
        final name = entity['name'] ?? '';
        final id = entity['id'] ?? '';
        final gender = entity['gender'] ?? '';

        setOcrRelateField(identifyInfo, info, name, id, gender);
        commitCertify(identifyInfo, info, name, id, gender);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CertifiesBloc, CertifiesState>(
        listener: (context, state) async {
      if (state is CertifiesRequestState) {
        if (_formKey.currentState!.validate()) {
        }
        context.read<CertifiesBloc>().add(CertifyStepContinue());
      }
    }, builder: (context, state) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            ...state.identifyInfo.map((e) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildFormItem(
                      info: e,
                      controller: generateController(e),
                      onChanged: (s) {
                        onChanged(state.identifyInfo, e, s);

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
  // item part
}
