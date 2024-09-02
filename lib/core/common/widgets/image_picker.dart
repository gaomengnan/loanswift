import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';

class RUpload extends StatelessWidget {
  final String label;
  const RUpload({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100.h,
          child: Column(
            children: [
              Expanded(
                  child: RText(
                text: label,
                size: 16.sp,
              )),
              const Expanded(
                flex: 2,
                child: Image(
                  image: AssetImage(
                    Assets.uploadPlaceholder,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
