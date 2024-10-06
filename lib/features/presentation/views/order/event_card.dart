import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/app_text.dart';
import 'package:loanswift/core/constants/constants.dart';
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
        left: 20.w,
      ),
      child: Container(
        width: ScreenUtil().screenWidth,
        decoration: const BoxDecoration(
            //color: Colors.pink,
            ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
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
              padding: const EdgeInsets.all(10),
              width: double.maxFinite,
              height: 100.h,
              margin: EdgeInsets.only(
                //horizontal: 10.w,
                top: 10.h,
                //bottom: 10.h,
                right: 10.w,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(5.0),
                //border: Border.all(
                //  color: Pallete.timelineNo,
                //width: 1,
                //),
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
                        UI.kWidth5(),
                        RText(
                          text: status,
                          color: isPast ? Colors.blue : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade200,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          //color: Colors.blueAccent,
                          ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RText(
                            text: amountDesc,
                            //size: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          UI.kWidth50(),
                          Expanded(
                            child: RText(
                              maxLines: 2,
                              text: amount,
                              size: 13.sp,
                            ),
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
