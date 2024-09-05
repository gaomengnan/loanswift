import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/utils.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';

class ImagePickEntity {
  final String filePath;
  final String path;

  ImagePickEntity({required this.filePath, required this.path});
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
    super.initialValue,
    super.onSaved,
    AutovalidateMode super.autovalidateMode =
        AutovalidateMode.onUserInteraction,
  }) : super(
          validator: (value) {
            if (info.certifyIsMust != 1) {
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
                      child: Image.file(File(file.filePath)),
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

                                    state.didChange([
                                      ImagePickEntity(
                                          filePath: pickedFiles.path,
                                          path: object)
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

                                    state.didChange([
                                      ImagePickEntity(
                                          filePath: file.path, path: object)
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
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: RText(
                    text: label,
                    size: 16.sp,
                    fontWeight: FontWeight.w600,
                  )),
                  UI.kHeight5(),
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: GestureDetector(
                        onTap: () async {
                          showUploadTypeBottomSheet(context);
                        },
                        child: state.value == null || state.value!.isEmpty
                            ? const Image(
                                image: AssetImage(
                                  Assets.uploadPlaceholder,
                                ),
                              )
                            : SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  spacing: 10.w,
                                  direction: Axis.horizontal,
                                  children: [
                                    ...state.value!.map((f) => SizedBox(
                                          height: 80.h,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Image.file(
                                                  File(f.filePath),
                                                  height: 50.h,
                                                  width: 100.w,
                                                  //height: 150,
                                                  //width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  width: 100.w,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.black12,
                                                  ),
                                                  child: Center(
                                                    child: Wrap(
                                                      spacing: 10.w,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .center,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            state.didChange(
                                                                List.from(state
                                                                    .value!)
                                                                  ..remove(f));

                                                            if (onChanged != null) {
                                                              onChanged('');
                                                            }
                                                          },
                                                          child: const Icon(
                                                              IconlyBold
                                                                  .delete),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            showImagePreview(
                                                                context, f);
                                                          },
                                                          child: const Icon(Icons
                                                              .remove_red_eye),
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
