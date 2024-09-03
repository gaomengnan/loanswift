import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';

class ImagePickerFormField extends FormField<List<File>> {
  final String label;
  final BuildContext context;
  ImagePickerFormField({
    super.key,
    required this.label,
    required this.context,
    super.initialValue,
    super.onSaved,
    super.validator,
    AutovalidateMode super.autovalidateMode =
        AutovalidateMode.onUserInteraction,
  }) : super(
          builder: (FormFieldState<List<File>> state) {
            void _showImagePreview(BuildContext context, File file) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: InteractiveViewer(
                      // 可以缩放和平移的图片预览
                      child: Image.file(file),
                    ),
                  );
                },
              );
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
                    maxLines: 1,
                    size: 16.sp,
                    fontWeight: FontWeight.w600,
                  )),
                  UI.kHeight5(),
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final picker = ImagePicker();
                              final pickedFiles = await picker.pickMultiImage();
                              if (pickedFiles.isNotEmpty) {
                                final files = pickedFiles
                                    .map((pickedFile) => File(pickedFile.path))
                                    .toList();
                                state.didChange(List.from(state.value ?? [])
                                  ..addAll(files));
                              }
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
                                                      f,
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
                                                                      ..remove(
                                                                          f));
                                                              },
                                                              child: const Icon(
                                                                  IconlyBold
                                                                      .delete),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                _showImagePreview(
                                                                    context, f);
                                                              },
                                                              child: const Icon(
                                                                  Icons
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
}

//class FormImageFiled extends StatelessWidget {
//  final String label;
//
//  final void Function(String)? onChanged;
//
//  const FormImageFiled({
//    super.key,
//    required this.label,
//    this.onChanged,
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      children: [
//        SizedBox(
//          height: 100.h,
//          child: Column(
//            children: [
//              Expanded(
//                  child: RText(
//                text: label,
//                size: 16.sp,
//              )),
//              const Expanded(
//                flex: 2,
//                child: image(
//                  image: assetimage(
//                    assets.uploadplaceholder,
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ],
//    );
//  }
//}
