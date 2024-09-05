import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/app_text.dart';
import 'package:loanswift/core/utils.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:loanswift/features/domain/usecases/common/ocr.dart';
import 'package:loanswift/features/presentation/bloc/certify/certifies_bloc.dart';
import 'package:loanswift/features/presentation/views/person/build_form_item.dart';
import 'package:loanswift/features/presentation/views/widgets/camera_scanner.dart';

import '../../../../core/common/widgets/widgets.dart';
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

  late String imagez = Assets.idcardFront;
  late String imagef = Assets.idcardReverse;

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

  void setOcrRelateField(Info info, String name, String id, String gender) {
    final nameController = _controllers['name'];
    final idController = _controllers['id_number'];
    final genderController = _controllers['sex'];

    if (nameController != null) {
      nameController.text = name.toString();

      context.read<CertifiesBloc>().add(CertifyCommitEvent(
          certifyId: info.certifyId, certifyResult: name.toString()));
    }

    if (idController != null) {
      idController.text = id.toString();
      context.read<CertifiesBloc>().add(CertifyCommitEvent(
          certifyId: info.certifyId, certifyResult: id.toString()));
    }

    if (genderController != null) {
      genderController.text = gender.toString();
      context.read<CertifiesBloc>().add(CertifyCommitEvent(
          certifyId: info.certifyId, certifyResult: gender.toString()));
    }
  }

  void onChanged(Info info, String s) async {
    /*  增加 OCR 图片识别逻辑  */

    // 使用 认证项 certify_id  = 2

    if (info.certifyId == 2){
      if (s.isEmpty) {
        setOcrRelateField(info, "", "", "");
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
        final gender = entity['gender'];

        setOcrRelateField(info, name, id, gender);
      });

      // 提交数据
      //sl<AuthRepo>().commitCertify(data: {
      //  'certify_id': info.certifyId,
      //  'certify_result': s,
      //});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CertifiesBloc, CertifiesState>(
        listener: (context, state) {
      if (state is CertifiesRequestState) {
        if (_formKey.currentState!.validate()) {}
      }
    }, builder: (context, state) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            ...state.settings.identityInfo.map((e) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildFormItem(
                      info: e,
                      controller: generateController(e),
                      onChanged: (s) {
                        onChanged(e, s);

                        print('${e.certifyFieldName} change - $s');
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

  Widget buildCardDescription() {
    return RText(
      size: 17.sp,
      fontWeight: FontWeight.bold,
      text: S.current.idcard,
    );
  }

  Widget buildItem(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildExpandedItem(
          context,
          imagez,
          S.current.idcard_front,
          1,
        ),
        UI.kWidth10(),
        buildExpandedItem(
          context,
          imagef,
          S.current.idcard_reverse,
          2,
        ),
      ],
    );
  }

  // item part
  void showUploadTypeBottomSheet(context) {
    showModalBottomSheet(
        isDismissible: false,
        // backgroundColor: Colors.grey.withOpacity(
        //   0.1,
        // ),
        context: context,
        builder: (context) {
          return Container(
            height: 150.h,
            // width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contenxt) => const CardScanner(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.withOpacity(
                            0.3,
                          ), // 可以更改颜色
                          width: 1.0, // 可以更改宽度
                        ),
                      ),
                    ),
                    child: Center(
                      child: RText(
                        text: S.current.take_photo,
                        size: 17.sp,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                    final resp = await Utils.pickerImageFromGallery();
                    if (resp != null && resp.path != "") {
                      setState(() {
                        if (tapIndex == 1) {
                          imagez = resp.path;
                        } else if (tapIndex == 2) {
                          imagef = resp.path;
                        }
                      });
                    }
                  },
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.withOpacity(
                            0.1,
                          ), // 可以更改颜色
                          width: 8, // 可以更改宽度
                        ),
                      ),
                    ),
                    child: Center(
                      child: RText(
                        text: S.current.take_photo_from_gallery,
                        size: 17.sp,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blue, // 可以更改颜色
                          width: 2.0, // 可以更改宽度
                        ),
                      ),
                    ),
                    height: 50.h,
                    width: double.infinity,
                    child: Center(
                      child: RText(
                        text: S.current.cancel,
                        size: 17.sp,
                      ),
                    ),
                  ),
                ),
                // 关闭按钮
              ],
            ),
          );
        });
  }

  Widget buildExpandedItem(
      BuildContext context, String image, String text, int index) {
    return Expanded(
      child: Container(
        //height: 140.h,
        decoration: BoxDecoration(
          // color: Color(0xffFAFAFA),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    tapIndex = index;
                  });
                  showUploadTypeBottomSheet(context);
                },
                child: Center(
                  child: Image(
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image,
                    ),
                  ),
                ),
              ),
            ),
            // UI.kHeight10(),
            RText(
              size: 15.sp,
              text: text,
              textAlign: TextAlign.center,
            ),
            UI.kHeight10(),
          ],
        ),
      ),
    );
  }
}
