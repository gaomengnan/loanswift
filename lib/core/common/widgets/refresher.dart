import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Refresher extends StatefulWidget {
  final Widget child;

  final RefreshController refresh;

  final AnimationController anicontroller, scaleController;

  final void Function(RefreshController controller) onRefresh;

  const Refresher({
    super.key,
    required this.child,
    required this.onRefresh,
    required this.refresh,
    required this.anicontroller,
    required this.scaleController,
  });

  @override
  State<Refresher> createState() => _RefresherState();
}

class _RefresherState extends State<Refresher> {
  late AnimationController _anicontroller, _scaleController;
  //late AnimationController _footerController;
  late RefreshController _refreshController;

  // late bool _isLoading = false;

  @override
  void initState() {
    _refreshController = widget.refresh;

    _anicontroller = widget.anicontroller;

    _scaleController = widget.scaleController;

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
    //_refreshController.dispose();
    //_scaleController.dispose();
    //_footerController.dispose();
    //_anicontroller.dispose();
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
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
            strokeWidth: 4,
          ),
        ),
      ),
      enablePullDown: true,
      enablePullUp: false,
      controller: _refreshController,
      onRefresh: () async {
        widget.onRefresh(_refreshController);
        //await Future.delayed(const Duration(milliseconds: 2000));
        //_refreshController.refreshCompleted();
        // setState(() {
        // _isLoading = false;
        // });
      },
      //onLoading: () async {
      //  await Future.delayed(const Duration(milliseconds: 1000));
      //  setState(() {});
      //  _refreshController.loadComplete();
      //},
      child: widget.child,
    );
  }
}
