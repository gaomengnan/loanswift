import 'package:flutter/material.dart';
import 'package:loanswift/core/common/widgets/day_picker.dart';
import 'package:loanswift/core/common/widgets/image_picker.dart';
import 'package:loanswift/core/common/widgets/input.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';

class BuildFormItem extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  final Info info;

  const BuildFormItem({
    super.key,
    required this.label,
    this.validator,
    required this.controller,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    switch (info.certifyFieldsCate) {
      case "txt":
        return RInput(
          hitText: label,
          label: label,
          controller: controller,
        );

      case "file":
        return RUpload(label: label);

      case "day":
        return Container();

      default:
        return RDay(
          hitText: label,
          label: label,
          controller: controller,
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
