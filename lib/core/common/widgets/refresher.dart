import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Refresher extends StatefulWidget {
  final Widget child;

  const Refresher({
    super.key,
    required this.child,
  });

  @override
  State<Refresher> createState() => _RefresherState();
}

class _RefresherState extends State<Refresher> with TickerProviderStateMixin {
  late AnimationController _anicontroller, _scaleController;
  //late AnimationController _footerController;
  final RefreshController _refreshController = RefreshController();

  late bool _isLoading = false;

  @override
  void initState() {
    _anicontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _scaleController =
        AnimationController(value: 0.0, vsync: this, upperBound: 1.0);

    _refreshController.headerMode?.addListener(() {
      if (_refreshController.headerStatus == RefreshStatus.idle) {
        _scaleController.value = 0.0;
        _anicontroller.reset();
      } else if (_refreshController.headerStatus == RefreshStatus.refreshing) {
        _anicontroller.repeat();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scaleController.dispose();
    //_footerController.dispose();
    _anicontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      header: ClassicHeader(
        textStyle: const TextStyle(
          color: Colors.black,
        ),
        refreshStyle: RefreshStyle.Follow,
        refreshingIcon: SizedBox(
          width: 10.w,
          height: 10.h,
          child: const CircularProgressIndicator(
            strokeWidth: 4,
          ),
        ),
      ),
      enablePullDown: true,
      enablePullUp: false,
      controller: _refreshController,
      onRefresh: () async {
        setState(() {
          _isLoading = true;
        });
        await Future.delayed(const Duration(milliseconds: 3000));
        _refreshController.refreshCompleted();
        setState(() {
          _isLoading = false;
        });
      },
      //onLoading: () async {
      //  await Future.delayed(const Duration(milliseconds: 1000));
      //  setState(() {});
      //  _refreshController.loadComplete();
      //},
      child: _isLoading
          ? Skeletonizer(
              enabled: true,
              child: widget.child,
            )
          : widget.child,
    );
  }
}
