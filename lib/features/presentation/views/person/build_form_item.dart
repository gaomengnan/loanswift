import 'package:flutter/material.dart';
import 'package:loanswift/core/common/widgets/input.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:loanswift/features/presentation/views/widgets/form_day.dart';
import 'package:loanswift/features/presentation/views/widgets/form_image_picker.dart';

class BuildFormItem extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  //final TextEditingController controller;

  final Info info;

  const BuildFormItem({
    super.key,
    required this.label,
    this.validator,
    //required this.controller,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    switch (info.certifyFieldsCate) {
      case "txt":
        return RInput(
          hitText: label,
          label: label,
          //controller: controller,
        );

      case "file":
        return ImagePickerFormField(
          label: label,
          context: context,
        );

      case "day":
        return FormDayField(
          hitText: label,
          label: label,
          onChanged: (val) {
          },
        );

      default:
        return FormDayField(
          hitText: label,
          label: label,
          onChanged: (val) {
            print('lis $val');
          },
        );
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
