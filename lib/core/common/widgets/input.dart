import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';

class RInput extends StatelessWidget {
  final String hitText;
  final String label;
  final TextEditingController controller;

  const RInput({
    super.key,
    required this.hitText,
    required this.label, required this.controller,
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
              ),
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
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
