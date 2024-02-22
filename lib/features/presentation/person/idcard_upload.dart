import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/utils.dart';
import 'package:loanswift/theme/pallete.dart';

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

  void showUploadTypeBottomSheet(context) {
    showModalBottomSheet(
        enableDrag: false,
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
                Container(
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
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contenxt) => const CardScanner(),
                        ),
                      );
                    },
                    child: Center(
                      child: AppText(
                        text: "拍摄",
                        size: 17.sp,
                      ),
                    ),
                  ),
                ),
                Container(
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
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Utils.pickerImageFromGallery();
                    },
                    child: Center(
                      child: AppText(
                        text: "从相册选择",
                        size: 17.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 10.sp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UI.kHeight10(),
            buildIDCardPreviewWidget(
              context,
              Assets.idcardFront,
              S.current.idcard_front,
            ),

            Space(
              height: 10.h,
              width: 0,
            ),

            buildIDCardPreviewWidget(
              context,
              Assets.idcardReverse,
              S.current.idcard_reverse,
            ),

            // const UploadPart()
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
              ),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Pallete.primaryColor,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          5.0.r,
                        ), // 设置圆角半径
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: AppText(text: "下一步"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIDCardPreviewWidget(
      BuildContext context, String image, String text) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          width: 2.w,
          color: Colors.blue,
        ),
        // image: const DecorationImage(
        //   image: AssetImage(
        //     Assets.idcardFront,
        //   ),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        child: Stack(
          children: [
            ClipRect(
              child: Image(
                width: double.infinity,
                height: double.infinity,
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: IconButton(
                onPressed: () {
                  showUploadTypeBottomSheet(context);
                },
                icon: Icon(
                  IconlyBold.plus,
                  size: 50.sp,
                  color: Pallete.primaryColor,
                ),
              ),
            ),
            Positioned(
              bottom: 20.h,
              left: 0,
              right: 0,
              child: Center(
                child: AppText(
                  text: text,
                  size: 17.sp,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
