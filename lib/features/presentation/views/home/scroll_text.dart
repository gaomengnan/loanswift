import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/common/messages.dart';
import 'package:loanswift/features/domain/usecases/common/get_notify_messages.dart';
import 'package:marquee/marquee.dart';

class ScrollText extends StatefulWidget {
  const ScrollText({super.key});

  @override
  State<ScrollText> createState() => _ScrollTextState();
}

class _ScrollTextState extends State<ScrollText>
    with SingleTickerProviderStateMixin {

  late Future<List<MessagesEntity>> _action;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _action,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<MessagesEntity> data = snapshot.data!;

            // 使用 forEach 遍历列表
            final noticeMessage = data.map((e) => e.notice).join('            ');

            return SliverPadding(
              padding: EdgeInsets.only(
                left: 20.w, right: 20.w, top: 10.h, bottom: 20.h,
                //vertical: 10.h,
              ),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 3.h,
                    right: 10.w,
                    left: 10.w,
                  ),
                  decoration: BoxDecoration(
                    // color: Pallete.secondaryColor,
                    borderRadius: BorderRadius.circular(
                      5.sp,
                    ),
                  ),
                  height: 16.h,
                  child: Marquee(
                    text: noticeMessage,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 20.0,
                    velocity: 100.0,
                    pauseAfterRound: const Duration(seconds: 1),
                    startPadding: 0.0,
                    accelerationDuration: const Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: const Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOutCubic,
                  ),
                ),
              ),
            );
          }
          return const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          );
        });
  }


  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
    _action = loadNotifyMessagesData();
  }

  // 获取通知消息功能
  Future<List<MessagesEntity>> loadNotifyMessagesData() async {
    GetNotifyMessages getNotifyMessages = sl<GetNotifyMessages>();
    final data = await getNotifyMessages.call();
    return data.fold((l) {
      return [];
    }, (r) {
      return r;
    });
  }
}
