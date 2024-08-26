import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/constants/app.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/presentation/bloc/auth/auth_bloc.dart';
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
        AppText(
          text: label,
          size: 13.sp,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(builder: (
        context,
        state,
      ) {
        final isLogin = state.authenticationStatus.isLogined;
        debugPrint('login state $isLogin');

        final logined =
            GetStorage().read<DataMap>(AppContant.tokenKey) ?? DataMap();
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
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: const EdgeInsets.only(
                  left: 15.0,
                  bottom: 15,
                ),
                title: scrolled
                    ? AppText(
                        text: "Welcome ~ ${isLogin ? loginPhone : ''}",
                        size: 18.sp,
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
                          if (!isLogin) {
                            Navigator.of(context).pushNamed(
                              AuthPage.routerName,
                            );
                          } else {
                            UI.showLogoutConfirmDialog(
                                context, '注销', '你确定要退出登陆吗？', () {
                              context.read<AuthBloc>().add(UserLogoutEvent());

                              Navigator.of(context).pop();
                            });
                          }
                        },
                        title: Row(
                          children: [
                            AppText(
                              text: isLogin
                                  ? loginPhone
                                  : S.current.login_or_register,
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
                      text: S.current.my_repayment,
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
                        AppText(
                          text: S.current.no_credit_limit,
                          size: 14.sp,
                        ),
                        UI.kHeight5(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              "/get_ed",
                            );
                          },
                          child: Text(
                            S.current.get_credit_limit,
                            style: const TextStyle(
                              color: Pallete.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
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
                            Icons.home,
                            S.current.loan_return,
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
                            Navigator.of(context).pushNamed(
                              "/repayment",
                            );
                          },
                          child: _buildIconButton(
                            Icons.search,
                            S.current.auto_repayment,
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
                            Icons.person,
                            S.current.bill_state,
                            const Color(0xffE8E67D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item #$index'),
                  );
                },
                childCount: 50, // 列表项的数量
              ),
            ),
          ],
        );
      }),
    );
  }
}
