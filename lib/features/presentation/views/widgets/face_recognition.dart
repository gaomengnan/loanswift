import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

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
            return SizedBox(
              height: 200.h,
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
                    ],
                  ),
                  UI.kHeight10(),
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () async {
                        //showUploadTypeBottomSheet(context);
                      },
                      child: state.value == null || state.value!.isEmpty
                          ? const Image(
                            //height: 50.h,
                            //width: 150.w,
                            fit: BoxFit.cover,
                            image: AssetImage(
                              Assets.facePlaceholder,
                            ),
                          )
                          : Wrap(
                              spacing: 50.w,
                              direction: Axis.horizontal,
                              children: [
                                ...state.value!.map((f) => SizedBox(
                                      height: 180.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 7,
                                            child: info.isCertify()
                                                ? CachedNetworkImage(
                                                    height: 200.h,
                                                    width: 300.w,
                                                    fit: BoxFit.cover,
                                                    imageUrl: f.url,
                                                    placeholder:
                                                        (context, url) =>
                                                            Center(
                                                                child: Shimmer
                                                                    .fromColors(
                                                      baseColor:
                                                          Colors.grey[300]!,
                                                      highlightColor:
                                                          Colors.grey[100]!,
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 200.0,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                  )
                                                : Image.file(
                                                    File(f.url),
                                                    height: 200.h,
                                                    width: ScreenUtil()
                                                        .screenWidth,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              width: 300.w,
                                              decoration: BoxDecoration(
                                                color: Pallete.primaryColor
                                                    .withOpacity(0.2),
                                              ),
                                              child: Center(
                                                child: Wrap(
                                                  spacing: 50.w,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        state.didChange(
                                                            List.from(
                                                                state.value!)
                                                              ..remove(f));

                                                        if (onChanged != null) {
                                                          onChanged('');
                                                        }
                                                      },
                                                      child: Icon(
                                                          color: Pallete
                                                              .whiteColor,
                                                          size: 24.sp,
                                                          IconlyBold.delete),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        //showImagePreview(
                                                        //    context, f);
                                                      },
                                                      child: Icon(
                                                          color: Pallete
                                                              .whiteColor,
                                                          size: 24.sp,
                                                          Icons.remove_red_eye),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                    ),
                  ),
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
