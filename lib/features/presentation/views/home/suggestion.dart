import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';

import '../../../../core/core.dart';
import '../../../../theme/theme.dart';

class BuildSuggestion extends StatelessWidget {
  const BuildSuggestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> loanGuide = [
      {
        "title": S.current.title700,
        "icon": IconlyBold.tickSquare,
      },
      {
        "title": S.current.title800,
        "icon": IconlyBold.activity,
      },
      {
        "title": S.current.title900,
        "icon": IconlyBold.wallet,
      },
    ];
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Pallete.backgroundColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 20.w,
              ),
              child: Container(
                decoration: const BoxDecoration(
                    // color: Pallete.backgroundColor,
                    // color: Colors.orange,
                    // borderRadius: BorderRadius.circular(5),
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: S.current.title600,
                      size: 16.sp,
                    ),
                    UI.kHeight10(),
                    Container(
                      width: double.infinity,
                      // height: 200,
                      decoration: BoxDecoration(
                        gradient: Pallete.loanGradient,
                        color: Pallete.whiteColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.h,
                        ),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            UI.kWidth10(),
                            ...List.generate(loanGuide.length, (index) {
                              final item = loanGuide[index];

                              return Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // icon
                                    Icon(
                                      item["icon"],
                                      color: Pallete.primaryColor,
                                    ),

                                    SizedBox(
                                      height: 5.h,
                                    ),

                                    AppText(
                                      text: item["title"],
                                      size: 12.sp,
                                    ),
                                    // title
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            //  other
          ],
        ),
      ),
    );
  }
}
