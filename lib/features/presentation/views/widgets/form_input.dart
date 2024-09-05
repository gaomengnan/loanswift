import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';

class RInput extends StatelessWidget {
  final String hitText;
  //final String label;
  //final bool isMust;
  //final String prompt;
  final TextEditingController? controller;

  final Info info;

  final void Function(String)? onChanged;

  const RInput({
    super.key,
    required this.hitText,
    this.onChanged,
    this.controller,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: info.isCertify() ?  Colors.green : Colors.grey,
              ),
              UI.kWidth5(),
              Expanded(
                child: RText(
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  size: 13.sp,
                  fontWeight: FontWeight.w600,
                  text: info.certifyFieldName,
                ),
              ),
            ],
          ),
          UI.kHeight5(),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (info.certifyIsMust == 1) {
                    return null;
                  }

                  if (value == null || value.isEmpty) {
                    return info.promptSubtitle;
                  }

                  return null;
                },
                controller: controller,
                onChanged: onChanged,
                decoration: const InputDecoration(
                    focusedErrorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    //contentPadding: EdgeInsets.only(left: 10.w),
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
