import 'package:flutter/material.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:loanswift/features/presentation/views/widgets/face_recognition.dart';
import 'package:loanswift/features/presentation/views/widgets/form_cascade.dart';
import 'package:loanswift/features/presentation/views/widgets/form_day.dart';
import 'package:loanswift/features/presentation/views/widgets/form_image_picker.dart';
import 'package:loanswift/features/presentation/views/widgets/form_input.dart';
import 'package:loanswift/features/presentation/views/widgets/form_select.dart';

class BuildFormItem extends StatelessWidget {
  //final String label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  final Info info;

  final void Function(String)? onChanged;

  const BuildFormItem({
    super.key,
    //required this.label,
    this.validator,
    this.controller,
    required this.info,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    switch (info.certifyFieldsCate) {
      case "txt":
        final cerResult =
            info.certifyResult == null ? '' : info.certifyResult.toString();

        String? initVal;

        if (controller != null) {
          controller!.text = cerResult;
        } else {
          initVal = cerResult.toString();
        }
        return RInput(
          initVal: initVal,
          hitText: info.certifyFieldName,
          onChanged: (s) async {
            if (onChanged != null) {
              onChanged!(s);
            }
          },
          controller: controller,
          info: info,
        );

      case "file":
        return ImagePickerFormField(
          info: info,
          label: info.certifyFieldName,
          context: context,
          onChanged: (s) async {
            if (onChanged != null) {
              onChanged!(s);
            }
          },
        );

      case "url":
        return FaceRecognotion(
          info: info,
          context: context,
          onChanged: (s) async {
            if (onChanged != null) {
              onChanged!(s);
            }
          },
        );

      case "day":
        return FormDayField(
          hitText: info.certifyFieldName,
          //label: label,
          onChanged: onChanged,
          info: info,
          //isMust: info.certifyIsMust == 1,
          //prompt: info.promptSubtitle,
        );

      case "enum":
        return FormSelectField(
          hitText: info.certifyFieldName,
          info: info,
          onChanged: onChanged,
        );

      case "citySelect":
        return FormCascade(
          hitText: info.certifyFieldName,
          info: info,
          onChanged: onChanged,
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
