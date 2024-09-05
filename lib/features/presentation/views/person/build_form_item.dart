import 'package:flutter/material.dart';
import 'package:loanswift/core/common/widgets/input.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:loanswift/features/presentation/views/widgets/form_day.dart';
import 'package:loanswift/features/presentation/views/widgets/form_image_picker.dart';

class BuildFormItem extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  final Info info;

  final void Function(String)? onChanged;

  const BuildFormItem({
    super.key,
    required this.label,
    this.validator,
    this.controller,
    required this.info,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    switch (info.certifyFieldsCate) {
      case "txt":
        return RInput(
          hitText: label,
          label: label,
          onChanged: onChanged,
          isMust: info.certifyIsMust == 1,
          prompt: info.promptSubtitle,
          controller: controller,
        );

      case "file":
        return ImagePickerFormField(
          info: info,
          label: label,
          context: context,
          onChanged: (s) async {
            //UI.showLoadingWithMessage(context, '开始OCR');
            //final Ocr ocr = sl<Ocr>();
            //
            //final resp  = await ocr.call(OcrParams(objectKey: s));
            //print('ocr resup $resp');
            //
            //
            //UI.hideLoading();
            if (onChanged != null) {
              onChanged!(s);
            }
          },
        );

      case "day":
        return FormDayField(
          hitText: label,
          label: label,
          onChanged: onChanged,
          isMust: info.certifyIsMust == 1,
          prompt: info.promptSubtitle,
        );

      default:
        return const Text('未知类型');
    }

    //return isSelect
    //    ? DropdownButtonFormField(
    //        items: items?.map(
    //          (val) {
    //            return DropdownMenuItem<String>(
    //              value: val["value"].toString(),
    //              child: Text(val["label"].toString()),
    //            );
    //          },
    //        ).toList(),
    //        onChanged: (_) {},
    //      )
    //    : RInput(
    //        hitText: label,
    //        label: label,
    //        controller: controller,
    //      );
  }
}
