import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/loading_page.dart';
import 'package:loanswift/core/common/widgets/webview.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:loanswift/features/presentation/bloc/home/home_bloc.dart';
import 'package:loanswift/features/presentation/views/home/banner.dart';
import 'package:loanswift/features/presentation/views/home/bill.dart';
import 'package:loanswift/features/presentation/views/home/main_product.dart';
import 'package:loanswift/features/presentation/views/home/suggestion.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  late AnimationController _anicontroller, _scaleController;

  @override
  void initState() {
    _anicontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _scaleController =
        AnimationController(value: 0.0, vsync: this, upperBound: 1.0);

    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _anicontroller.dispose();
    _scaleController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<HomeBloc>().add(HomeRefreshEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLogined = context
        .select((AuthBloc auth) => auth.state.authenticationStatus.isLogined);

    final feedbackUrl = context
        .select((HomeBloc auth) => auth.state.homeData.other.feedbackUrl);

    debugPrint('isLogined: $isLogined');

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
          GestureDetector(
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
            child: const Icon(
              Icons.feedback_rounded,
            ),
          ),
          UI.kWidth20(),
        ],
        leading: Row(
          children: [
            UI.kWidth20(),
            RText(
              text: "Hi~ ${S.current.welcome_you}",
              size: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        if (state is HomeLoadFailure) {
          UI.showError(
            context,
            state.error.error,
          );
        }
        if (_refreshController.isRefresh) {
          _refreshController.refreshCompleted();
        }
      }, builder: (context, state) {
        if (state is HomeLoading) {
          return const LoadingPage();
        }

        return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Refresher(
              anicontroller: _anicontroller,
              scaleController: _scaleController,
              refresh: _refreshController,
              onRefresh: (ctrl) {
                context.read<HomeBloc>().add(HomeRefreshEvent());
              },
              child: CustomScrollView(
                slivers: [
                  // Appbar
                  //BuildAppBar(),
                  // banner
                  SliverPadding(padding: EdgeInsets.only(top: 5.h)),
                  BuildBanner(
                    banners: state.homeData.banners,
                  ),

                  /*   Bill Amount */
                  BuildBill(
                    userOrder: state.homeData.userOrders,
                  ),

                  // 查看额度
                  BuildMainProductEntry(
                    mainProducts: state.homeData.mainProducts,
                    rule: state.homeData.rules,
                  ),

                  // 借钱攻略

                  if (state.homeData.apiProducts.isNotEmpty)
                    BuildSuggestion(
                      apiProducts: state.homeData.apiProducts,
                      rule: state.homeData.rules,
                    ),

                  //const SliverPadding(
                  //  padding: EdgeInsets.all(8.0),
                  //  sliver: SliverToBoxAdapter(
                  //    child: Divider(
                  //      color: Colors.black12,
                  //    ),
                  //  ),
                  //),

                  //const BuildContactUS(),
                  /*  Apps  */
                  //BuildAppList(),
                ],
              ),
            ));
      }),
    );
  }
}
