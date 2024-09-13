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
        scrolled = _scrollController.offset > 50.h;
      });
    });
  }

  Widget _buildIconButton(IconData icon, String label, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      //mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 30,
          color: color,
        ),
        UI.kWidth10(),
        const SizedBox(height: 5),
        RText(
          text: label,
          size: 13.sp,
        ),
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

        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Pallete.whiteColor,
              floating: true,
              snap: true,
              pinned: true,
              expandedHeight: 100.0.h,
              //backgroundColor: Colors.white,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  child: scrolled
                      ? Padding(
                          padding: EdgeInsets.only(left: 10.0.w, bottom: 10.h),
                          child: Row(
                            children: [
                              RText(
                                text: "Welcome ~ $loginPhone",
                                size: 16.sp,
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                //titlePadding: const EdgeInsets.only(
                //  left: 15.0,
                //  bottom: 15,
                //),
                title: ListTile(
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
                  title: Row(
                    children: [
                      RText(
                        text:
                            isLogin ? loginPhone : S.current.login_or_register,
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
                    child: RText(
                      text: S.current.my_repayment,
                      size: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      //vertical: 20.h,
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
                        Padding(
                          padding: EdgeInsets.only(
                            left: 27.w,
                          ),
                          child: const Divider(),
                        ),
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
                        Padding(
                          padding: EdgeInsets.only(
                            left: 27.w,
                          ),
                          child: const Divider(),
                        ),
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
                        Padding(
                          padding: EdgeInsets.only(
                            left: 27.w,
                          ),
                          child: const Divider(),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              "/order_detail",
                            );
                          },
                          child: _buildIconButton(
                            Icons.info_rounded,
                            S.current.my_account_about_us,
                            const Color(0xffE8E67D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                    child: RText(
                      text: S.current.my_account_privacy_policy,
                      size: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      //vertical: 20.h,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      //direction: Axis.vertical,
                      //spacing: 20.h,
                      children: [
                        ...protocols.map(
                          (e) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebViewComponent(
                                      url: e.path,
                                      title: e.name,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15.h,
                                  horizontal: 10.w,
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 5.h,
                                ),
                                //width: 300,
                                width: ScreenUtil().screenWidth,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RText(
                                      fontWeight: FontWeight.w500,
                                      text: e.name,
                                      size: 14.sp,
                                      textAlign: TextAlign.start,
                                    ),
                                    const Icon(Icons.arrow_right_rounded)
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

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
        );
      }),
    );
  }
}
