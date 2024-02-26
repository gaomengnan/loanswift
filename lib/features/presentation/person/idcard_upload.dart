import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/utils.dart';

import '../../../core/common/widgets/widgets.dart';
import '../../../core/core.dart';
import '../../../core/generated/l10n.dart';
import '../widgets/camera_scanner.dart';

class IDCardUpload extends StatefulWidget {
  const IDCardUpload({super.key});

  @override
  State<IDCardUpload> createState() => _IDCardUploadState();
}

class _IDCardUploadState extends State<IDCardUpload> {
  @override
  Widget build(BuildContext context) {
    return const BuildUploadCardPart();
  }
}

class BuildUploadCardPart extends StatelessWidget {
  const BuildUploadCardPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CardPart();
  }
}

class CardPart extends StatelessWidget {
  const CardPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      // color: Pallete.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0).r, // 调整此值以设置圆角的大小
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
            buildCardDescription(),
            UI.kHeight10(),
            buildItem(context),
          ],
        ),
      ),
    );
  }

  Widget buildCardDescription() {
    return AppText(
      size: 17.sp,
      fontWeight: FontWeight.bold,
      text: S.current.idcard,
    );
  }

  Widget buildItem(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildExpandedItem(
          context,
          Assets.idcardFront,
          S.current.idcard_front,
        ),
        UI.kWidth10(),
        buildExpandedItem(
          context,
          Assets.idcardReverse,
          S.current.idcard_reverse,
        ),
      ],
    );
  }

  // item part
  void showUploadTypeBottomSheet(context) {
    showModalBottomSheet(
        isDismissible: false,
        // backgroundColor: Colors.grey.withOpacity(
        //   0.1,
        // ),
        context: context,
        builder: (context) {
          return Container(
            height: 150.h,
            // width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              color: Colors.white,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contenxt) => const CardScanner(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.withOpacity(
                            0.3,
                          ), // 可以更改颜色
                          width: 1.0, // 可以更改宽度
                        ),
                      ),
                    ),
                    child: Center(
                      child: AppText(
                        text: "拍摄",
                        size: 17.sp,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Utils.pickerImageFromGallery();
                  },
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.withOpacity(
                            0.1,
                          ), // 可以更改颜色
                          width: 8, // 可以更改宽度
                        ),
                      ),
                    ),
                    child: Center(
                      child: AppText(
                        text: "从相册选择",
                        size: 17.sp,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blue, // 可以更改颜色
                          width: 2.0, // 可以更改宽度
                        ),
                      ),
                    ),
                    height: 50.h,
                    width: double.infinity,
                    child: Center(
                      child: AppText(
                        text: "取消",
                        size: 17.sp,
                      ),
                    ),
                  ),
                ),
                // 关闭按钮
              ],
            ),
          );
        });
  }

  Widget buildExpandedItem(BuildContext context, String image, String text) {
    return Expanded(
      child: Container(
        // width: double.infinity,
        // height: 140.h,
        decoration: BoxDecoration(
          // color: Color(0xffFAFAFA),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: GestureDetector(
                onTap: () {
                  showUploadTypeBottomSheet(context);
                },
                child: Center(
                  child: Image(
                    image: AssetImage(
                      image,
                    ),
                  ),
                ),
              ),
            ),
            // UI.kHeight10(),
            AppText(
              size: 15.sp,
              text: text,
              textAlign: TextAlign.center,
            ),
            UI.kHeight10(),
          ],
        ),
      ),
    );
  }
}
