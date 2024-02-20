import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/constants/assets.dart';
import 'package:loanswift/constants/ui.dart';
import 'package:loanswift/generated/l10n.dart';

import '../../common/widgets/app_text.dart';

class IDCardUpload extends StatefulWidget {
  const IDCardUpload({super.key});

  @override
  State<IDCardUpload> createState() => _IDCardUploadState();
}

class _IDCardUploadState extends State<IDCardUpload> {
  @override
  Widget build(BuildContext context) {
    return const BuildUploadCardWidget();
  }
}

class BuildUploadCardWidget extends StatelessWidget {
  const BuildUploadCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      // color: Pallete.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0), // 调整此值以设置圆角的大小
        side: const BorderSide(
          color: Colors.white70,
          // width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 10.sp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CardDescription(),
            UI.kHeight10(),
            const UploadContent()
          ],
        ),
      ),
    );
  }
}

class UploadContent extends StatelessWidget {
  const UploadContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ExpandedUploadItem(
          image: Assets.idcardFront,
          text: S.current.idcard_front,
        ),
        UI.kWidth10(),
        ExpandedUploadItem(
          image: Assets.idcardReverse,
          text: S.current.idcard_reverse,
        ),
      ],
    );
  }
}

class ExpandedUploadItem extends StatelessWidget {
  final String image;
  final String text;
  const ExpandedUploadItem({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: double.infinity,
        height: 130.h,
        decoration: BoxDecoration(
          // color: Color(0xffFAFAFA),
          color: Colors.grey.withOpacity(0.1),
          // image: DecorationImage(
          //   // fit: BoxFit.cover,
          //   image: AssetImage(
          //     Assets.idcardFront,
          //   ),
          // ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Center(
                child: Image(
                  image: AssetImage(
                    image,
                  ),
                ),
              ),
            ),
            UI.kHeight10(),
            AppText(
              text: text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class CardDescription extends StatelessWidget {
  const CardDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      size: 15.sp,
      fontWeight: FontWeight.bold,
      text: S.current.idcard,
    );
  }
}
