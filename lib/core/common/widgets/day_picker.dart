import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';

class RDay extends StatelessWidget {
  final String hitText;
  final String label;
  final TextEditingController controller;

  const RDay({
    super.key,
    required this.hitText,
    required this.label,
    required this.controller,
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
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                onTap: () {
                  print('tab');
                },
                readOnly: true,
                controller: controller,
                decoration: InputDecoration(
                  focusColor: Colors.red,
                    contentPadding: EdgeInsets.only(left: 10.w),
                    hintText: "请选择",
                    focusedBorder: InputBorder.none,
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
