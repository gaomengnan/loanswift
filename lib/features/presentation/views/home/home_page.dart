import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/constants/ui.dart';
import 'package:loanswift/features/presentation/views/home/banner.dart';
import 'package:loanswift/features/presentation/views/home/bill.dart';
import 'package:loanswift/features/presentation/views/home/quota.dart';
import 'package:loanswift/features/presentation/views/home/suggestion.dart';

import '../../../../core/common/widgets/widgets.dart';
import '../../../../core/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late AnimationController _anicontroller, _scaleController;
  //final RefreshController _refreshController = RefreshController();
  //int count = 20;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //_refreshController.dispose();
    //_scaleController.dispose();
    //_footerController.dispose();
    //_anicontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: ScreenUtil().screenWidth,
        elevation: 0,
        toolbarHeight: 50.h,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
            ),
          ),
        ),
        actions: [
          const Icon(
            IconlyBold.message,
          ),
          UI.kWidth20(),
        ],
        leading: Row(
          children: [
            UI.kWidth20(),
            AppText(
              text: "Hi~ ${S.current.welcome_you}",
              size: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: Container(
          decoration: const BoxDecoration(
              //gradient: LinearGradient(
              //    begin: Alignment.topCenter,
              //    end: Alignment.bottomCenter,
              //    //stops: [0.0, 0.3, 0.6],
              //    colors: [
              //      Pallete.primaryColor,
              //      Pallete.primaryColor,
              //      Pallete.backgroundColor,
              //    ]),
              ),
          //height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Refresher(
            child: CustomScrollView(
              slivers: [
                // Appbar
                //BuildAppBar(),
                // banner
                BuildBanner(),

                // 查看额度
                BuildQuota(),

                /*   Bill Amount */
                BuildBill(),

                // 借钱攻略

                BuildSuggestion(),

                SliverPadding(
                  padding: EdgeInsets.all(8.0),
                  sliver: SliverToBoxAdapter(
                    child: Divider(
                      color: Colors.black12,
                    ),
                  ),
                ),

                BuildContactUS(),
                /*  Apps  */
                //BuildAppList(),
              ],
            ),
          )),
    );
  }
}

class BuildContactUS extends StatelessWidget {
  const BuildContactUS({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: SizedBox(
            width: 100.w,
            height: 30.h,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/contact_us",
                );
              },
              child: AppText(
                text: '联系我们',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
