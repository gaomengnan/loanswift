import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/app_text.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/common/messages.dart';
import 'package:loanswift/features/domain/usecases/common/get_notify_messages.dart';
import 'package:loanswift/theme/pallete.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late Future<List<MessagesEntity>> _action;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _action,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<MessagesEntity> data = snapshot.data!;

            return SliverPadding(
              padding: EdgeInsets.only(
                left: 20.w, right: 20.w, top: 10.h, bottom: 20.h,
                //vertical: 10.h,
              ),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Pallete.primaryColor.withOpacity(0.2), // 阴影颜色
                        spreadRadius: 3, // 阴影扩散程度
                        blurRadius: 5, // 阴影模糊程度
                        offset: const Offset(1, 3), // 阴影偏移量 (水平, 垂直)
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey.shade100, // 边框颜色
                      width: 1.0, // 边框宽度
                    ),
                    color: Pallete.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(
                      10.sp,
                    )),
                  ),
                  child: Row(
                    children: [
                      // 左侧固定部分
                      SizedBox(
                        width: 40,
                        height: 60,
                        //color: Colors.blue,
                        child: Image.asset(
                          Assets.messageLogoGIF,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: CarouselSlider.builder(
                          itemCount: (data.length / 1).ceil(),
                          itemBuilder: (context, itemIndex, pageIndex) {
                            int totalPages = (data.length / 1).ceil();
                            int loopedPageIndex = pageIndex % totalPages;
                            int startIndex = loopedPageIndex * 1;
                            int endIndex = startIndex + 1;
                            List<MessagesEntity> pageData = data.sublist(
                                startIndex,
                                endIndex > data.length
                                    ? data.length
                                    : endIndex);

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...List.generate(pageData.length, (e) {
                                  // 0 1 2
                                  int index = e;
                                  final currentData = pageData[index];
                                  return RText(
                                    height: 0,
                                    text: currentData.notice,
                                    maxLines: 3,
                                    textAlign: TextAlign.start,
                                  );
                                }),
                              ],
                            );
                          },
                          options: CarouselOptions(
                            autoPlayCurve: Curves.easeInOutCubic,
                            scrollPhysics: const NeverScrollableScrollPhysics(),
                            viewportFraction: 1,
                            height: 50.h,
                            scrollDirection: Axis.horizontal,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                          ),
                        ),
                      ),
                    ],
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

  @override
  void dispose() {
    super.dispose();
  }

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
