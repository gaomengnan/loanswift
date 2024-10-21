import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/data/models/order_confirm_model.dart';
import 'package:loanswift/features/domain/entity/orders/order_confirm.dart';
import 'package:loanswift/features/domain/usecases/order/check_order.dart';
import 'package:loanswift/features/domain/usecases/order/order_confirm.dart';
import 'package:loanswift/theme/pallete.dart';

class OrderConfirmDialog extends StatefulWidget {
  final int productId;
  final Function(BuildContext context)? callback;

  final VoidCallback? onCancel;

  const OrderConfirmDialog({
    super.key,
    required this.productId,
    this.callback,
    this.onCancel,
  });

  @override
  //_ExpandableDialogState createState() => _ExpandableDialogState();
  State<OrderConfirmDialog> createState() => _OrderConfirmDialogState();
}

class _OrderConfirmDialogState extends State<OrderConfirmDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  late Future<OrderConfirmModel> _dataFuture; // 用于存储数据的 Future

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _dataFuture = getData(widget.productId); // 在初始化时获取数据
  }

  @override
  void dispose() {
    _controller.dispose(); // 释放 AnimationController
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      if (_isExpanded) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dataFuture,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          UI.showLoading();
          return const SizedBox.shrink();
        }

        if (snap.hasError) {
          UI.showError(context, snap.error.toString());
          Navigator.pop(context);
          return const SizedBox.shrink();
        }

        UI.hideLoading();

        return AlertDialog(
          actions: [
            // 添加两个按钮
            TextButton(
              onPressed: () {
                if (widget.onCancel != null) {
                  widget.onCancel!();
                }
                //Navigator.of(context).pop(); // 关闭对话框
              },
              child: Text(S.current.cancel),
            ),
            ElevatedButton(
              onPressed: () async {
                UI.showLoading();

                final CheckOrder checkOrder = sl();

                final resp = await checkOrder.call(CheckOrderParam(
                    isConfim: "0", productId: widget.productId));

                resp.fold((l) => UI.showError(context, l.message), (r) {
                  //UI.showSuccess(context, message);
                  UI.hideLoading();
                  //Navigator.of(context).pop(); // 关闭对话框
                  if (widget.callback != null) {
                    widget.callback!(context);
                  }
                });
              },
              child: Text(
                S.current.confirm,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
          title: Text(S.current.order_confirm_title),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildItem(context, S.current.order_confirm_service_fee,
                        snap.data!.serviceFee.toString(),
                        isDescription: true, desc: snap.data!.serviceFeeDesc),

                    buildItem(context, S.current.order_confirm_interest_fee,
                        snap.data!.interestFee.toString()),

                    //buildItem(context, S.current.order_confirm_first_period_fee,
                    //    snap.data!.firstPeriodInterest.toString()),

                    buildItem(context, S.current.order_confirm_repay_amount,
                        snap.data!.repayAmount.toString()),

                    //buildItem(context, S.current.order_confirm_total_interest,
                    //    snap.data!.totalInterest.toString()),

                    //buildItem(
                    //    context,
                    //    S.current.order_confirm_total_service_fee,
                    //    snap.data!.totalServiceFee.toString()),
                    //buildItem(context, S.current.order_confirm_deduction_fee,
                    //    snap.data!.deductionFee.toString()),
                    buildItem(context, S.current.order_confirm_actual_amount,
                        snap.data!.actualAmount.toString()),

                    buildItem(
                        context,
                        S.current.order_confirm_first_period_pay_time,
                        snap.data!.firstPeriodPayTime.toString()),

                    buildItem(context, S.current.order_confirm_repayment_amount,
                        snap.data!.repaymentAmount.toString()),
                    //AnimatedSize(
                    //  duration: const Duration(milliseconds: 50),
                    //  curve: Curves.fastOutSlowIn,
                    //  child: _isExpanded
                    //      ? Column(
                    //          crossAxisAlignment: CrossAxisAlignment.start,
                    //          children: [
                    //            //buildItem(
                    //            //    context,
                    //            //    S.current.order_confirm_deduction_fee,
                    //            //    snap.data!.deductionFee.toString()),
                    //            //buildItem(
                    //            //    context,
                    //            //    S.current
                    //            //        .order_confirm_first_period_interest_fee,
                    //            //    snap.data!.firstPeriodInterestFee
                    //            //        .toString()),
                    //            //buildItem(
                    //            //    context,
                    //            //    S.current
                    //            //        .order_confirm_platform_management_fee,
                    //            //    snap.data!.platformManagementFee
                    //            //        .toString()),
                    //            //buildItem(
                    //            //    context,
                    //            //    S.current.order_confirm_risk_service_fee,
                    //            //    snap.data!.riskServiceFee.toString()),
                    //            //buildItem(
                    //            //    context,
                    //            //    S.current.order_confirm_actual_amount,
                    //            //    snap.data!.actualAmount.toString()),
                    //            //buildItem(
                    //            //    context,
                    //            //    S.current
                    //            //        .order_confirm_first_period_pay_time,
                    //            //    snap.data!.firstPeriodPayTime.toString()),
                    //            //buildItem(
                    //            //    context,
                    //            //    S.current.order_confirm_processing_fee,
                    //            //    snap.data!.processingFee.toString()),
                    //            //buildItem(
                    //            //    context,
                    //            //    S.current.order_confirm_gst_fee,
                    //            //    snap.data!.gstFee.toString()),
                    //            //buildItem(
                    //            //    context,
                    //            //    S.current.order_confirm_repayment_amount,
                    //            //    snap.data!.repaymentAmount.toString()),
                    //          ],
                    //        )
                    //      : const SizedBox.shrink(),
                    //),
                    //TextButton(
                    //  onPressed: _toggleExpansion,
                    //  child: Row(
                    //    children: [
                    //      Text(_isExpanded
                    //          ? S.current.order_confirm_collapse
                    //          : S.current.order_confirm_see_more),
                    //      Icon(_isExpanded
                    //          ? Icons.arrow_drop_up
                    //          : Icons.arrow_drop_down),
                    //    ],
                    //  ),
                    //),
                    const Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        S.current.order_confirm_repayment_plan,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                    ...List.generate(snap.data!.repayPlan.length, (index) {
                      final dagta = snap.data!.repayPlan[index];
                      return buildPlan(dagta);
                    }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildPlan(RepayPlanConfirm plan) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        padding: EdgeInsets.all(10.h),
        child: Column(
          children: [
            //const Row(
            //  crossAxisAlignment: CrossAxisAlignment.center,
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //  children: [
            //    Text("asd"),
            //    Text("21231"),
            //  ],
            //),
            //UI.kHeight5(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(plan.payTime),
                Text('${plan.repayMoney}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<OrderConfirmModel> getData(productId) async {
  final OrderConfim orderConfim = sl();

  final resp = await orderConfim
      .call(OrderConfirmParam(isConfim: "1", productId: productId));

  return resp.fold((l) => Future.error(l.message), (r) {
    return r;
  });
}

/*  订单试算弹窗  */
void showOrderConfirmDialog(
  BuildContext context, {
  required int productId,
  Function(BuildContext context)? onOK,
  VoidCallback? onCancel,
}) {
  showDialog(
    barrierDismissible: false,
    //useRootNavigator: false,
    context: context,
    //barrierColor: Colors.grey.shade50,
    builder: (context) {
      return OrderConfirmDialog(
        productId: productId,
        callback: onOK,
        onCancel: onCancel,
      );
    },
  );
}

/* 挽留弹窗 */

void showRetainDialog(
  BuildContext context, {
  Function(BuildContext context)? onOK,
  VoidCallback? onCancel,
}) {
  List<String> tags = [
    S.current.easy_to_use,
    S.current.fast_approval,
    S.current.flexible_repayment,
    S.current.daily_interest,
    S.current.fast_disbursement,
    //S.current.compliant_platform,
    //S.current.privacy_security,
  ];
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.9),
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          //height: ScreenUtil().screenHeight * .5,
          //width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            gradient: Pallete.quotaGradien,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                    ),
                    child: RText(
                      textAlign: TextAlign.start,
                      text: S.current.please_ask,
                      size: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RText(
                    textAlign: TextAlign.start,
                    text: S.current.whether_abandon_benefits,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    size: 15.sp,
                  ),
                  UI.kHeight20(),
                  RText(text: "${S.current.everyone_says}:"),
                  UI.kHeight10(),
                  Wrap(
                    spacing: 8.0, // 标签之间的水平间距
                    runSpacing: 8.0, // 标签之间的垂直间距
                    children: List.generate(tags.length, (index) {
                      final currentTag = tags[index];
                      return Container(
                        padding: const EdgeInsets.all(5),
                        //width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.task_alt,
                              color: Colors.green,
                              size: 12.sp,
                            ),
                            UI.kWidth5(),
                            Text(
                              currentTag,
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (onOK != null) {
                                onOK(context);
                              }
                            },
                            child: RText(
                              text: S.current.continue_to_apply,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              size: 10.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                              onPressed: () {
                                if (onCancel != null) {
                                  onCancel();
                                }
                              },
                              child: RText(
                                text: S.current.cruelly_reject,
                                fontWeight: FontWeight.bold,
                                size: 10.sp,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
      //return AlertDialog(
      //  title: const Text("请问您"),
      //  content: Column(
      //    mainAxisAlignment: MainAxisAlignment.start,
      //    crossAxisAlignment: CrossAxisAlignment.start,
      //    children: [
      //      RText(
      //        text: "是否要放弃以下福利?",
      //        color: Colors.black,
      //        fontWeight: FontWeight.bold,
      //        size: 15.sp,
      //      ),
      //      UI.kHeight20(),
      //      RText(text: "大家都说:"),
      //
      //    ],
      //  ),
      //  actions: <Widget>[
      //    ElevatedButton(
      //      child: RText(
      //        text: "继续申请",
      //        color: Colors.white,
      //        fontWeight: FontWeight.bold,
      //      ),
      //      onPressed: () {
      //        // ... 执行删除操作
      //        Navigator.of(context).pop(true); //关闭对话框
      //      },
      //    ),
      //    TextButton(
      //      child: const Text("残忍拒绝"),
      //      onPressed: () => Navigator.of(context).pop(), //关闭对话框
      //    ),
      //  ],
      //);
    },
  );
}

Widget buildItem(BuildContext context, String label, String value,
    {bool isDescription = false, String desc = ""}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: isDescription
              ? GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          //title: Text('Tip'),
                          content: Text(desc),
                          actions: <Widget>[
                            TextButton(
                              child: Text(S.current.confirm),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      UI.kWidth5(),
                      if (isDescription)
                        Flexible(
                          child: Icon(
                            Icons.info_rounded,
                            size: 11.sp,
                          ),
                        ),
                    ],
                  ),
                )
              : Text(
                  label,
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
