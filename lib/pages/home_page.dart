import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/common/widgets/app_text.dart';
import 'package:loanswift/constants/assets.dart';
import 'package:loanswift/generated/l10n.dart';
import 'package:loanswift/theme/pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Pallete.primaryColor,
                Pallete.primaryColor,
                Pallete.primaryColor,
                Pallete.primaryColor,
                Pallete.whiteColor,
                Pallete.whiteColor,
                Pallete.whiteColor,
                Pallete.whiteColor,
                Pallete.whiteColor,
              ],
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                toolbarHeight: 50.h,
                backgroundColor: Pallete.whiteColor,
                expandedHeight: 65.0.h,
                floating: false, // 设置为 true 时，滚动时 AppBar 会固定在顶部
                pinned: true, // 设置为 true 时，AppBar 滚动到顶部时会固定在那里
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      color: Pallete.primaryColor,
                    ),
                  ),
                ),
                leading: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    const CircleAvatar(
                      backgroundImage: AssetImage(
                        Assets.userAvatar,
                      ),
                      // backgroundColor: Pallete.redColor,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Pallete.whiteColor,
                      borderRadius: BorderRadius.circular(8).r,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ).h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text:
                                "${S.current.maximun_load_text}${S.current.maximun_load_text_unit}",
                            // color: Pallete.whiteColor,
                            size: 13.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50.w,
                            ),
                            child: Divider(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
                          AppText(
                            text: "200,000",
                            size: 35.sp,
                            color: Pallete.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),

                          AppText(
                            text: S.current.maximun_load_sub_text,
                            size: 10.sp,
                            color: Pallete.greyColor,
                            // fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // SliverList(
              //   delegate: SliverChildBuilderDelegate(
              //     (BuildContext context, int index) {
              //       return ListTile(
              //         title: Text('Item $index'),
              //       );
              //     },
              //     childCount: 50, // 为了演示，创建了50个列表项
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
