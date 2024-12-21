import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/constants/constants.dart';
import 'package:loanswift/theme/theme.dart';

class RepaymentLine extends StatelessWidget {
  final String amount;

  final String title;

  final String dateline;

  final String desc;

  final bool isPost;

  const RepaymentLine({
    super.key,
    required this.amount,
    required this.title,
    required this.dateline,
    required this.desc,
    required this.isPost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RText(
                text: amount,
                size: 16.sp,
              ),
              Ui.kHeight5(),
              RText(
                text: title,
                size: 14.sp,
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RText(
                    text: dateline,
                    size: 16.sp,
                  ),
                  Ui.kHeight5(),
                  RText(
                    text: desc,
                    size: 14.sp,
                  ),
                ],
              ),
              Ui.kWidth10(),
              Icon(
                color: isPost ? Pallete.primaryColor : Colors.grey,
                isPost
                    ? Icons.check_circle_outline_rounded
                    : Icons.highlight_off_rounded,
              ),
            ],
          )
        ],
      ),
    );
  }
}
