import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveness_detection/liveness_detection.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/utils.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickEntity {
  final String imgData;
  final String url;

  ImagePickEntity({
    required this.imgData,
    this.url = '',
  });
}

class FaceRecognotion extends FormField<List<ImagePickEntity>> {
  final BuildContext context;
  final Info info;
  final void Function(String)? onChanged;
  FaceRecognotion({
    super.key,
    required this.context,
    required this.info,
    this.onChanged,
    //super.initialValue,
    super.onSaved,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
          initialValue: info.isCertify()
              ? [
                  ImagePickEntity(imgData: ''),
                ]
              : [],
          validator: (value) {
            if (!info.isMust()) {
              return null;
            }

            if (value == null || value.isEmpty) {
              return info.promptSubtitle;
            }
            return null;
          },
          builder: (FormFieldState<List<ImagePickEntity>> state) {
            final faceRect = LivenessDetection();
            return SizedBox(
              //height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: info.isCertify()
                            ? Lottie.asset(
                                height: 20.h,
                                width: 20.w,
                                Assets.check,
                                repeat: false,
                              )
                            : Icon(
                                size: 19.sp,
                                Icons.task_alt,
                                color: info.isCertify()
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                      ),
                      UI.kWidth5(),
                      Expanded(
                        child: RText(
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          text: info.certifyFieldName,
                          size: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          try {
                            final status = await Permission.camera.status;
                            if (status != PermissionStatus.granted) {
                              await Permission.camera.request();
                            }

                            final faceData = await faceRect.startFaceRect();

                            File imgFile = await Utils.base64ToFile(
                                faceData ?? '', "face.png");
                            final resp = await Utils.uploadImage(
                                imgFile.path, "living_img");

                            resp.fold(
                              (err) => UI.showError(context, err.message),
                              (l) {
                                UI.hideLoading();

                                final body = l.data as DataMap?;
                                //final path = body?['data']['path'];
                                final object = body?['data']['object'];
                                final url = body?['data']['path'];

                                state.didChange([
                                  ImagePickEntity(
                                    imgData: object,
                                    url: url,
                                  )
                                ]);

                                if (onChanged != null) {
                                  onChanged(object);
                                }

                                //state.didChange(List.from(state.value ?? [])
                                //  ..addAll([File(pickedFiles.path)]));
                              },
                            );
                          } catch (_) {}
                          //showUploadTypeBottomSheet(context);
                        },
                        child: info.isCertify()
                            ? RText(
                                text: S.current.verified,
                                color: Colors.green,
                              )
                            : RText(text: S.current.go_to_verify),
                      )
                    ],
                  ),
                  //,
                  UI.kHeight5(),
                  if (state.hasError)
                    RText(
                      text: info.promptSubtitle,
                      color: Colors.red,
                    )
                ],
              ),
            );
          },
        );
}
