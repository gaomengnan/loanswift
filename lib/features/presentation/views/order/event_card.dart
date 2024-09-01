import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/app_text.dart';
import 'package:loanswift/theme/theme.dart';

class EventCard extends StatelessWidget {
  final Widget asset;
  final String title;
  final String status;
  final String amount;
  final String amountDesc;

  final bool isPast;

  const EventCard({
    super.key,
    required this.asset,
    required this.title,
    required this.status,
    required this.amount,
    required this.amountDesc,
    required this.isPast,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
        left: 10.w,
      ),
      child: Container(
        width: ScreenUtil().screenWidth,
        decoration: const BoxDecoration(
            //color: Colors.pink,
            ),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                //Opacity(
                //  opacity: 1,
                //  child: asset,
                //),
                //const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //const SizedBox(
                    //  height: 6,
                    //),
                  ],
                ),
              ],
            ),
            Container(
              width: double.maxFinite,
              height: 50.h,
              margin: EdgeInsets.only(
                //horizontal: 10.w,
                top: 10.h,
                bottom: 10.h,
                right: 10.w,
              ),
              decoration: BoxDecoration(
                color: Pallete.timelineNo,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Pallete.timelineNo,
                  width: 2.0,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          color: isPast ? Pallete.primaryColor : Colors.red,
                          isPast ? IconlyBold.unlock : IconlyBold.lock,
                          size: 17.sp,
                        ),
                        const SizedBox(width: 8),
                        RText(
                          text: status,
                          color: isPast ? Pallete.primaryColor : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RText(
                            text: amountDesc,
                            size: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          RText(
                            text: amount,
                            size: 16.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
