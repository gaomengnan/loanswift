import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:lottie/lottie.dart';

class RInput extends StatelessWidget {
  final String hitText;
  //final String label;
  //final bool isMust;
  //final String prompt;
  final TextEditingController? controller;

  final Info info;

  final void Function(String)? onChanged;

  final String? initVal;

  const RInput({
    super.key,
    required this.hitText,
    this.onChanged,
    this.controller,
    required this.info,
    this.initVal,
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
                        Icons.task_alt,
                        color: info.isCertify() ? Colors.green : Colors.grey,
                      ),
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
                autovalidateMode: AutovalidateMode.disabled,
                validator: (value) {
                  if (!info.isMust()) {
                    return null;
                  }

                  if (value == null || value.isEmpty) {
                    return info.promptSubtitle;
                  }

                  return null;
                },
                initialValue: initVal,
                controller: controller,
                onFieldSubmitted: (s) {
                  if (s.isNotEmpty) {
                    onChanged!(s);
                  }
                },
                //onChanged: onChanged,
                decoration: const InputDecoration(
                  focusedErrorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  //contentPadding: EdgeInsets.only(left: 10.w),
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
