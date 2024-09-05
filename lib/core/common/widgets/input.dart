import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';

class RInput extends StatelessWidget {
  final String hitText;
  final String label;
  final bool isMust;
  final String prompt;
  final TextEditingController? controller;

  final void Function(String)? onChanged;

  const RInput({
    super.key,
    required this.hitText,
    required this.label,
    this.onChanged,
    this.isMust = false,
    this.prompt = '',
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RText(
              size: 13.sp,
              fontWeight: FontWeight.w600,
              text: label,
            ),
          ),
          //UI.kHeight5(),
          Expanded(
            flex: 2,
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
                  if (!isMust) {
                    return null;
                  }

                  if (value == null || value.isEmpty) {
                    return prompt;
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
