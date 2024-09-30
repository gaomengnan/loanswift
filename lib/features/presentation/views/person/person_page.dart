import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/webview.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/storage.dart';
import 'package:loanswift/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:loanswift/features/presentation/bloc/home/home_bloc.dart';
import 'package:loanswift/features/presentation/views/auth/auth_page.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:shimmer/shimmer.dart';

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
        scrolled = _scrollController.offset > 5000.h;
      });
    });
  }

  Widget _buildIconButton(IconData icon, String label, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 15.sp,
              color: color,
            ),
            UI.kWidth10(),
            //const SizedBox(height: 20),
            RText(
              text: label,
              size: 13.sp,
            ),
          ],
        ),
        const Icon(Icons.arrow_right_rounded)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    /*  获取 意见反馈 跳转地址  */
    final feedbackUrl =
        context.watch<HomeBloc>().state.homeData.other.feedbackUrl;

    final String cardListPath =
        context.watch<HomeBloc>().state.homeData.other.cardListPath;
    final protocols = context.watch<HomeBloc>().state.homeData.other.protocols;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        if (state is LogoutFailure) {
          UI.showError(context, state.error.error);
        }

        if (state is LogoutLoading) {
          UI.showLoading();
        }

        if (state is LogoutSuccess) {
          EasyLoading.dismiss();
        }
      }, builder: (
        context,
        state,
      ) {
        final isLogin = state.authenticationStatus.isLogined;
        debugPrint('login state $isLogin');

        final logined = Storage.token ?? DataMap();

        final loginPhone = logined['phone'].toString();

        return Scaffold(
          //backgroundColor: Colors.grey.shade200,
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Pallete.backgroundColor,
                floating: true,
                snap: true,
                pinned: true,
                //toolbarHeight: 30,
                //expandedHeight: 60.0.h,
                //backgroundColor: Colors.white,
                //bottom: PreferredSize(
                //  preferredSize: const Size.fromHeight(50),
                //  child: AnimatedSwitcher(
                //    duration: const Duration(milliseconds: 1000),
                //    child: scrolled
                //        ? Padding(
                //            padding: EdgeInsets.only(left: 10.0.w, bottom: 10.h),
                //            child: Row(
                //              children: [
                //                RText(
                //                  text: "Welcome ~ $loginPhone",
                //                  size: 16.sp,
                //                ),
                //              ],
                //            ),
                //          )
                //        : Container(),
                //  ),
                //),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(
                    left: 5.0.w,
                    //bottom: 15,
                  ),
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: GestureDetector(
                      onTap: () {
                        if (!isLogin) {
                          Navigator.of(context).pushNamed(
                            AuthPage.routerName,
                          );
                        } else {
                          UI.showLogoutConfirmDialog(context, S.current.logout,
                              S.current.logoutConfirmation, () {
                            context.read<AuthBloc>().add(UserLogoutEvent());

                            Navigator.of(context).pop();
                          });
                        }
                      },
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              size: 25,
                              Icons.person_rounded,
                              color: Colors.white,
                            ),
                          ),
                          UI.kWidth10(),
                          RText(
                            text: isLogin
                                ? loginPhone
                                : S.current.login_or_register,
                            size: 14.sp,
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
                  //title: ListTile(
                  //  leading: const CircleAvatar(
                  //    radius: 15,
                  //    backgroundColor: Colors.blue,
                  //    child: Icon(
                  //      size: 25,
                  //      Icons.person_rounded,
                  //      color: Colors.white,
                  //    ),
                  //  ),
                  //  //tileColor: Colors.orange,
                  //  onTap: () {
                  //    if (!isLogin) {
                  //      Navigator.of(context).pushNamed(
                  //        AuthPage.routerName,
                  //      );
                  //    } else {
                  //      UI.showLogoutConfirmDialog(context, S.current.logout,
                  //          S.current.logoutConfirmation, () {
                  //        context.read<AuthBloc>().add(UserLogoutEvent());
                  //
                  //        Navigator.of(context).pop();
                  //      });
                  //    }
                  //  },
                  //  title: Row(
                  //    children: [
                  //      RText(
                  //        text: isLogin
                  //            ? loginPhone
                  //            : S.current.login_or_register,
                  //        size: 14.sp,
                  //        textAlign: TextAlign.start,
                  //        fontWeight: FontWeight.w600,
                  //      ),
                  //      const Icon(
                  //        Icons.arrow_right,
                  //      )
                  //    ],
                  //  ),
                  //),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0.sp),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.w, vertical: 10.h),
                        child: RText(
                          text: S.current.my_repayment,
                          size: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        //margin: EdgeInsets.symmetric(
                        //  //horizontal: 10.w,
                        //  //vertical: 20.h,
                        //),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          //horizontal: 0.w,
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
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  "/my_order",
                                );
                              },
                              child: _buildIconButton(
                                Icons.inventory_rounded,
                                S.current.my_account_order_management,
                                const Color(0xffEE7C7A),
                              ),
                            ),
                            UI.kHeight20(),
                            //Padding(
                            //  padding: EdgeInsets.only(
                            //    left: 27.w,
                            //  ),
                            //  child: const Divider(),
                            //),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebViewComponent(
                                      url: cardListPath,
                                      title: S.current.my_account_my_bank_card,
                                    ),
                                  ),
                                );
                              },
                              child: _buildIconButton(
                                Icons.credit_card_rounded,
                                S.current.my_account_my_bank_card,
                                const Color(0xffEE7C7A),
                              ),
                            ),
                            UI.kHeight20(),
                            //Padding(
                            //  padding: EdgeInsets.only(
                            //    left: 27.w,
                            //  ),
                            //  child: const Divider(),
                            //),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebViewComponent(
                                      url: feedbackUrl,
                                      title: S.current.feedback,
                                    ),
                                  ),
                                );
                              },
                              child: _buildIconButton(
                                Icons.feedback_rounded,
                                S.current.feedback,
                                const Color(0xff8BCC0C),
                              ),
                            ),
                            //Padding(
                            //  padding: EdgeInsets.only(
                            //    left: 27.w,
                            //  ),
                            //  child: const Divider(),
                            //),
                            //InkWell(
                            //  onTap: () {
                            //    //Navigator.of(context).pushNamed(
                            //    //  "/order_detail",
                            //    //);
                            //  },
                            //  child: _buildIconButton(
                            //    Icons.info_rounded,
                            //    S.current.my_account_about_us,
                            //    const Color(0xffE8E67D),
                            //  ),
                            //),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //SliverPadding(
              //  padding: EdgeInsets.symmetric(
              //    horizontal: 30.w,
              //    vertical: 20.h,
              //  ),
              //  sliver: SliverToBoxAdapter(
              //    child: RText(
              //      textAlign: TextAlign.start,
              //      text: S.current.my_account_privacy_policy,
              //      size: 14.sp,
              //      fontWeight: FontWeight.w600,
              //    ),
              //  ),
              //),

              SliverToBoxAdapter(
                //padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20.0.w, right: 20.w, top: 10.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0.sp),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, top: 20.h),
                          child: RText(
                            textAlign: TextAlign.start,
                            text: S.current.my_account_privacy_policy,
                            size: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          //padding: EdgeInsets.symmetric(horizontal: 15.w,),
                          height: 100.h,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 10,
                              );
                            },
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                            ),
                            scrollDirection: Axis.horizontal,
                            //physics: const NeverScrollableScrollPhysics(),
                            //gridDelegate:
                            //    SliverGridDelegateWithMaxCrossAxisExtent(
                            //  maxCrossAxisExtent: 70.w, // 每个网格项的最大宽度为150
                            //  crossAxisSpacing: 5.w, // 列间距
                            //  mainAxisSpacing: 5.h, // 行间距
                            //  childAspectRatio: 1, // 每个网格项的宽高比例
                            //),
                            itemBuilder: (BuildContext context, int index) {
                              final data = protocols[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WebViewComponent(
                                        url: data.path,
                                        title: data.name,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CachedNetworkImage(
                                      placeholder: (context, url) => Center(
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            width: 25.w,
                                            height: 25.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            //margin: EdgeInsets.symmetric(
                                            //    horizontal: 10.h),
                                            //width: double.infinity,
                                            //height: 200.0,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      imageUrl: data.icon,
                                      height: 25.h,
                                      width: 25.w,
                                      fit: BoxFit.cover,
                                    ),
                                    UI.kHeight5(),
                                    SizedBox(
                                        width: 70.w,
                                        child: RText(
                                          text: data.name,
                                          maxLines: 2,
                                          size: 11.sp,
                                        )),
                                  ],
                                ),
                              );
                            },
                            itemCount: protocols.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //SliverToBoxAdapter(
              //  child: Column(
              //    crossAxisAlignment: CrossAxisAlignment.start,
              //    children: [
              //      Padding(
              //        padding: EdgeInsets.symmetric(
              //          horizontal: 20.w,
              //          vertical: 20.h,
              //        ),
              //        child: RText(
              //          text: S.current.my_account_privacy_policy,
              //          size: 18.sp,
              //          fontWeight: FontWeight.w600,
              //        ),
              //      ),
              //      Container(
              //        margin: EdgeInsets.symmetric(
              //          horizontal: 20.w,
              //          //vertical: 20.h,
              //        ),
              //        padding: EdgeInsets.symmetric(
              //          vertical: 10.h,
              //          horizontal: 20.w,
              //        ),
              //        height: 100,
              //        width: ScreenUtil().screenWidth,
              //        decoration: BoxDecoration(
              //          color: Pallete.whiteColor,
              //          borderRadius: BorderRadius.circular(
              //            8,
              //          ),
              //        ),
              //        child: GridView.builder(
              //          gridDelegate:
              //              const SliverGridDelegateWithFixedCrossAxisCount(
              //            crossAxisCount: 2, // 每行有三列
              //            crossAxisSpacing: 0,
              //            mainAxisSpacing: 0,
              //          ),
              //          itemCount: protocols.length,
              //          itemBuilder: (context, index) {
              //            return const Text("asdad");
              //          },
              //        ),
              //      ),
              //    ],
              //  ),
              //),

              SliverPadding(
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
              ),
              // SliverList(
              //   delegate: SliverChildBuilderDelegate(
              //     (BuildContext context, int index) {
              //       return ListTile(
              //         title: Text('Item #$index'),
              //       );
              //     },
              //     childCount: 50, // 列表项的数量
              //   ),
              // ),
            ],
          ),
        );
      }),
    );
  }
}
