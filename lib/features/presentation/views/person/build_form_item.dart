import 'package:flutter/material.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:loanswift/features/presentation/views/widgets/form_day.dart';
import 'package:loanswift/features/presentation/views/widgets/form_image_picker.dart';
import 'package:loanswift/features/presentation/views/widgets/form_input.dart';

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

        final cerResult = info.certifyResult == null ? '' : info.certifyResult.toString();
        if(controller != null) {
          controller!.text = cerResult;
        }
        return RInput(
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

      case "day":
        return FormDayField(
          hitText: info.certifyFieldName,
          //label: label,
          onChanged: onChanged,
          info: info,
          //isMust: info.certifyIsMust == 1,
          //prompt: info.promptSubtitle,
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
