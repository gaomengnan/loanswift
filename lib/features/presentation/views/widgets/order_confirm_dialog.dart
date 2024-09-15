import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/data/models/order_confirm_model.dart';
import 'package:loanswift/features/domain/entity/orders/order_confirm.dart';
import 'package:loanswift/features/domain/usecases/order/check_order.dart';
import 'package:loanswift/features/domain/usecases/order/order_confirm.dart';

class StateDialog extends StatefulWidget {
  final int productId;
  final Function(BuildContext context)? callback;

  const StateDialog({
    super.key,
    required this.productId,
    this.callback,
  });

  @override
  //_ExpandableDialogState createState() => _ExpandableDialogState();
  State<StateDialog> createState() => _StateDialogState();
}

class _StateDialogState extends State<StateDialog>
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
                Navigator.of(context).pop(); // 关闭对话框
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
                    buildItem(S.current.order_confirm_service_fee,
                        snap.data!.serviceFee.toString(),
                        isDescription: true, desc: snap.data!.serviceFeeDesc),
                    buildItem(S.current.order_confirm_interest_fee,
                        snap.data!.interestFee.toString()),
                    buildItem(S.current.order_confirm_first_period_fee,
                        snap.data!.firstPeriodInterest.toString()),
                    buildItem(S.current.order_confirm_repay_amount,
                        snap.data!.repayAmount.toString()),
                    buildItem(S.current.order_confirm_total_interest,
                        snap.data!.totalInterest.toString()),
                    buildItem(S.current.order_confirm_total_service_fee,
                        snap.data!.totalServiceFee.toString()),
                    buildItem(S.current.order_confirm_deduction_fee,
                        snap.data!.deductionFee.toString()),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 50),
                      curve: Curves.fastOutSlowIn,
                      child: _isExpanded
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildItem(S.current.order_confirm_deduction_fee,
                                    snap.data!.deductionFee.toString()),
                                buildItem(
                                    S.current
                                        .order_confirm_first_period_interest_fee,
                                    snap.data!.firstPeriodInterestFee
                                        .toString()),
                                buildItem(
                                    S.current
                                        .order_confirm_platform_management_fee,
                                    snap.data!.platformManagementFee
                                        .toString()),
                                buildItem(
                                    S.current.order_confirm_risk_service_fee,
                                    snap.data!.riskServiceFee.toString()),
                                buildItem(S.current.order_confirm_actual_amount,
                                    snap.data!.actualAmount.toString()),
                                buildItem(
                                    S.current
                                        .order_confirm_first_period_pay_time,
                                    snap.data!.firstPeriodPayTime.toString()),
                                buildItem(
                                    S.current.order_confirm_processing_fee,
                                    snap.data!.processingFee.toString()),
                                buildItem(S.current.order_confirm_gst_fee,
                                    snap.data!.gstFee.toString()),
                                buildItem(
                                    S.current.order_confirm_repayment_amount,
                                    snap.data!.repaymentAmount.toString()),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                    TextButton(
                      onPressed: _toggleExpansion,
                      child: Row(
                        children: [
                          Text(_isExpanded
                              ? S.current.order_confirm_collapse
                              : S.current.order_confirm_see_more),
                          Icon(_isExpanded
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down),
                        ],
                      ),
                    ),
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

  return resp.fold((l) => throw Exception(l.message), (r) {
    return r;
  });
}

void showOrderConfirmDialog(BuildContext context,
    {required int productId, Function(BuildContext context)? ck}) {
  showDialog(
    barrierDismissible: false,
    //useRootNavigator: false,
    context: context,
    //barrierColor: Colors.grey.shade50,
    builder: (context) {
      return StateDialog(
        productId: productId,
        callback: ck,
      );
    },
  );
}

Widget buildItem(String label, String value,
    {bool isDescription = false, String desc = ""}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
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
