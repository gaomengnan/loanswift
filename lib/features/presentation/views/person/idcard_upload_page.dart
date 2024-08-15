import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/utils.dart';
import 'package:loanswift/features/presentation/views/widgets/camera_scanner.dart';

import '../../../../core/common/widgets/widgets.dart';
import '../../../../core/core.dart';

class IDCardUploadPage extends StatefulWidget {
  const IDCardUploadPage({
    super.key,
  });

  @override
  State<IDCardUploadPage> createState() => _IDCardUploadPageState();
}

class _IDCardUploadPageState extends State<IDCardUploadPage> {
  late String imagez = Assets.idcardFront;
  late String imagef = Assets.idcardReverse;

  int tapIndex = 0;

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
          imagez,
          S.current.idcard_front,
          1,
        ),
        UI.kWidth10(),
        buildExpandedItem(
          context,
          imagef,
          S.current.idcard_reverse,
          2,
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
                        text: S.current.take_photo,
                        size: 17.sp,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                    final resp = await Utils.pickerImageFromGallery();
                    if (resp != null && resp.path != "") {
                      setState(() {
                        if (tapIndex == 1) {
                          imagez = resp.path;
                        } else if (tapIndex == 2) {
                          imagef = resp.path;
                        }
                      });
                    }
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
                        text: S.current.take_photo_from_gallery,
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
                        text: S.current.cancel,
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

  Widget buildExpandedItem(
      BuildContext context, String image, String text, int index) {
    return Expanded(
      child: Container(
        //height: 140.h,
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
                  setState(() {
                    tapIndex = index;
                  });
                  showUploadTypeBottomSheet(context);
                },
                child: Center(
                  child: Image(
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.cover,
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
