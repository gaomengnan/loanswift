import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/widgets.dart';
import '../../../../core/core.dart';
import '../../../../theme/theme.dart';

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: ScreenUtil().screenWidth,
      elevation: 0,
      toolbarHeight: 50.h,
      backgroundColor: Pallete.whiteColor,
      expandedHeight: 55.0.h,
      floating: false, //
      pinned: true, //
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            color: Pallete.primaryColor,
          ),
        ),
      ),
      actions: [
        const Icon(
          IconlyBold.message,
        ),
        Ui.kWidth20(),
      ],
      leading: Row(
        children: [
          Ui.kWidth20(),
          RText(
            text: "Hi~ ${S.current.welcome_you}",
            size: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
