import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/presentation/views/auth/auth_page.dart';
import 'package:loanswift/theme/pallete.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  late ScrollController _scrollController;
  bool scrolled = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0);
    _scrollController.addListener(() {
      setState(() {
        scrolled = _scrollController.offset > 100;
      });
    });
  }

  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 30,
          color: Pallete.primaryColor,
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Pallete.whiteColor,
            floating: true,
            snap: true,
            pinned: true,
            expandedHeight: 100.0.h,
            //backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              title: scrolled
                  ? AppText(
                      text: "Welcome ~",
                      size: 20.sp,
                    )
                  : ListTile(
                      leading: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          size: 30,
                          Icons.person_pin_circle_rounded,
                          color: Colors.white,
                        ),
                      ),
                      //tileColor: Colors.orange,
                      onTap: () {
                        Navigator.of(context).pushNamed(AuthPage.routerName);
                      },
                      title: Row(
                        children: [
                          AppText(
                            text: S.current.login_register,
                            size: 12.sp,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w600,
                          ),
                          const Icon(
                            Icons.arrow_right,
                          )
                        ],
                      ),
                    ),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: AppText(
                    text: "我的还款",
                    size: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 20.w,
                  ),
                  //height: 200,
                  width: ScreenUtil().screenWidth,
                  decoration: BoxDecoration(
                    color: Pallete.whiteColor,
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            text: "暂未获取额度，无账单",
                            size: 14.sp,
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                "/get_ed",
                              );
                            },
                            child: const Text(
                              "获取额度",
                              style: TextStyle(
                                color: Pallete.blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  "/my_order",
                                );
                              },
                              child: _buildIconButton(
                                Icons.home,
                                '借还记录',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  "/repayment",
                                );
                              },
                              child: _buildIconButton(
                                Icons.search,
                                '自动还款',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  "/order_detail",
                                );
                              },
                              child: _buildIconButton(
                                Icons.person,
                                '账单证明',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
          //SliverList(
          //  delegate: SliverChildBuilderDelegate(
          //    (BuildContext context, int index) {
          //      return ListTile(
          //        title: Text('Item #$index'),
          //      );
          //    },
          //    childCount: 50, // 列表项的数量
          //  ),
          //),
        ],
      ),
    );
  }
}
