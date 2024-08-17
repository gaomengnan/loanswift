import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/app_text.dart';
import 'package:loanswift/core/constants/constants.dart';
import 'package:loanswift/features/presentation/views/order/repayment_line.dart';
import 'package:loanswift/theme/pallete.dart';

class RepaymentPage extends StatelessWidget {
  const RepaymentPage({super.key});

  static const String routerName = '/repayment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 60.h,
        color: Colors.transparent,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.primaryColor,
          ),
          onPressed: () {},
          child: Text(
            "即刻还款",
            style: TextStyle(
              color: Pallete.whiteColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      //backgroundColor: Pallete.primaryColor.withOpacity(0.4),
      //backgroundColor: Pallete.color3,
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        title: const Text("贷款申请"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*

                Repayment Amount

            */

            const ReturnAmountComponent(),

            /*   end RepaymentAmount */

            /*
                repayment time line
            */

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              child: AppText(
                textAlign: TextAlign.start,
                text: "还款时间表",
                size: 20.sp,
                color: Pallete.blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),

            /*   timline content   */

            const ReturnTimeline(),

            /*  TIMELINE 2 */

            const Timeline2(),

            /* kind  tips smooth  */

            const BuildKindTips(),

            /*   BUILD TOTAL AMOUNT  */

            //UI.kHeight10(),
            //const BottomAmount(),

            /*  BUILD RETURNED BTN */
          ],
        ),
      ),
    );
  }
}

class BottomAmount extends StatelessWidget {
  const BottomAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          color: Pallete.blackColor,
          text: "60000",
          size: 18.sp,
        ),
        UI.kWidth10(),
        AppText(
          color: Pallete.blackColor,
          text: "全额付款",
          size: 18.sp,
        ),
      ],
    );
  }
}

class Timeline2 extends StatelessWidget {
  const Timeline2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Pallete.whiteColor,
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            item(
              "贷款本金",
              "2400",
            ),
            UI.kHeight5(),
            item(
              "贷款本金",
              "2400",
            ),
          ],
        ),
      ),
    );
  }

  Widget item(String k, String v) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          size: 16.sp,
          text: k,
        ),
        AppText(
          size: 16.sp,
          text: v,
        ),
      ],
    );
  }
}

class ReturnTimeline extends StatelessWidget {
  const ReturnTimeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      //decoration: BoxDecoration(
      //  boxShadow: [
      //    BoxShadow(
      //      color: Colors.grey.withOpacity(0.5), // 阴影颜色
      //      spreadRadius: 5, // 阴影扩散的半径
      //      blurRadius: 7, // 阴影模糊的半径
      //      offset: const Offset(0, 3), // 阴影位置的偏移量 (水平, 垂直)
      //    ),
      //  ],
      //borderRadius: const BorderRadius.all(
      //  Radius.circular(8),
      //),
      color: Colors.white,
      //),
      child: SizedBox(
        height: 200.h,
        child: const Column(
          children: [
            Expanded(
              child: RepaymentLine(
                amount: "R900",
                title: "偿还金额",
                dateline: "2024-09-8",
                desc: "T/1还款日期",
                isPost: true,
              ),
            ),
            Expanded(
              child: RepaymentLine(
                desc: "T/3还款日期",
                dateline: "2024-03-04",
                amount: "R60000",
                title: "还款金额",
                isPost: false,
              ),
            ),
            Expanded(
              child: RepaymentLine(
                desc: "T/2还款日期",
                dateline: "2024-03-04",
                amount: "R60000",
                title: "还款金额",
                isPost: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReturnAmountComponent extends StatelessWidget {
  const ReturnAmountComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Pallete.whiteColor,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                AppText(
                  text: "付款金额",
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
            UI.kHeight10(),
            AppText(
              size: 24.sp,
              fontWeight: FontWeight.w900,
              text: "600000",
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 100.w,
              ),
              child: const Divider(
                color: Colors.black12,
                thickness: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildKindTips extends StatelessWidget {
  const BuildKindTips({super.key});

  Widget buildKindTip(String text) {
    return ListTile(
      leading: const Icon(
        color: Pallete.primaryColor,
        Icons.fiber_manual_record,
      ),
      title: Text(
        text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Pallete.whiteColor,
      child: SizedBox(
        //height: 300.h,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Pallete.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(
                    10,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.lightbulb,
                  ),
                  AppText(
                    text: "温馨提示",
                    color: Pallete.whiteColor,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                buildKindTip(
                  "一般情况下，我们会按照您的申请申请的还款日来进行还款",
                ),
                buildKindTip(
                  "您可以随时通过刷新App获取最新信息",
                ),
                buildKindTip(
                  "成功还款后，您的还款申请将被标记为“已还款”",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
