import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/utils.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class ImagePickEntity {
  final String filePath;
  final String path;
  final String url;

  ImagePickEntity(
      {required this.filePath, required this.path, required this.url});
}

class ImagePickerFormField extends FormField<List<ImagePickEntity>> {
  final String label;
  final BuildContext context;
  final Info info;
  final void Function(String)? onChanged;
  ImagePickerFormField({
    super.key,
    required this.label,
    required this.context,
    required this.info,
    this.onChanged,
    //super.initialValue,
    super.onSaved,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
          initialValue: info.isCertify()
              ? [
                  ImagePickEntity(
                      filePath: '', path: '', url: info.certifyResult),
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
            void showImagePreview(BuildContext context, ImagePickEntity file) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: InteractiveViewer(
                      child: info.isCertify()
                          ? CachedNetworkImage(
                              imageUrl: file.url,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                            )
                          : Image.file(File(file.filePath)),
                    ),
                  );
                },
              );
            }

            void showUploadTypeBottomSheet(context) {
              showModalBottomSheet(
                  isDismissible: false,
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
                              //Navigator.push(
                              //  context,
                              //  MaterialPageRoute(
                              //    builder: (context) => const CardScanner()),
                              //);

                              final picker = ImagePicker();

                              final pickedFiles = await picker.pickImage(
                                source: ImageSource.camera,
                                maxWidth: 600,
                              );

                              //Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const CardScanner()));
                              //
                              if (pickedFiles != null) {
                                UI.showLoading();

                                final resp = await Utils.uploadImage(
                                  pickedFiles.path,
                                  info.certifyCode,
                                );

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
                                          filePath: pickedFiles.path,
                                          path: object,
                                          url: url)
                                    ]);

                                    if (onChanged != null) {
                                      onChanged(object);
                                    }

                                    //state.didChange(List.from(state.value ?? [])
                                    //  ..addAll([File(pickedFiles.path)]));
                                  },
                                );
                              }
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

                              //Utils.pickerImageFromGallery();
                              final picker = ImagePicker();
                              final file = await picker.pickImage(
                                source: ImageSource.gallery,
                              );

                              if (file != null) {
                                UI.showLoading();
                                final resp = await Utils.uploadImage(
                                  file.path,
                                  info.certifyCode,
                                );

                                resp.fold(
                                  (err) => UI.showError(context, err.message),
                                  (l) {
                                    UI.hideLoading();

                                    final body = l.data as DataMap?;
                                    final object = body?['data']['object'];
                                    final url = body?['data']['path'];

                                    state.didChange([
                                      ImagePickEntity(
                                          filePath: file.path,
                                          path: object,
                                          url: url)
                                    ]);

                                    if (onChanged != null) {
                                      onChanged(object);
                                    }

                                    //state.didChange(List.from(state.value ?? [])
                                    //  ..addAll([File(pickedFiles.path)]));
                                  },
                                );
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
                          text: label,
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
                        showUploadTypeBottomSheet(context);
                      },
                      child: state.value == null || state.value!.isEmpty
                          ? Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Image(
                                  //height: 300.h,
                                  width: 300.w,
                                  fit: BoxFit.cover,
                                  image: const AssetImage(
                                    Assets.idcardFront,
                                  ),
                                ),
                                Image(
                                  height: 50.h,
                                  image: const AssetImage(
                                    Assets.idcardFrontAdd,
                                  ),
                                ),
                              ],
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
                                                      child: Shimmer.fromColors(
                                                        baseColor:
                                                            Colors.grey[300]!,
                                                        highlightColor:
                                                            Colors.grey[100]!,
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 200.0,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Image.file(
                                                    File(f.filePath),
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
                                                          Icons.delete_rounded),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        showImagePreview(
                                                            context, f);
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
