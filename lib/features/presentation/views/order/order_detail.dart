import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/constants/constants.dart';
import 'package:loanswift/theme/theme.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  static const routerName = "/order_detail";

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  Widget buildTimeline() {
    return const Placeholder();
  }

  Widget buildListTile(String k, String v) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 5.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            //size: 12.sp,
            //fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
            text: k,
          ),
          AppText(
            //size: 15.sp,
            fontWeight: FontWeight.w600,
            text: v,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        title: const Text(
          "订单详情",
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const Icon(
                    IconlyBold.play,
                  ),
                  title: AppText(
                    text: "审查中",
                    textAlign: TextAlign.start,
                    size: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                  subtitle: AppText(
                    text: "您的订单正在审查中，请注意短信或者油箱查收！",
                    textAlign: TextAlign.start,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 1,
              child: Column(
                children: [
                  /*  
                    Application Logo And Name Desc 
                */

                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Color(0xffE3F4E6),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0,
                      ),
                      leading: UI.squareContainer(
                        const Icon(
                          IconlyLight.buy,
                        ),
                      ),
                      title: AppText(
                        textAlign: TextAlign.start,
                        text: "应用程序",
                        fontWeight: FontWeight.w600,
                        size: 14.sp,
                      ),
                    ),
                  ),

                  /*
                   Application Detail Desc
                */

                  /* 贷款日期 */

                  buildListTile("贷款日期", "asdada"),

                  /* 贷款金额 */

                  buildListTile("贷款金额", "asdada"),

                  /* 付款银行*/

                  buildListTile("付款银行", "asdada"),

                  /* 银行账号 */
                  buildListTile(
                    "银行账号 ",
                    "asdada",
                  ),
                  /* 还款金额 */
                  buildListTile(
                    "还款金额 ",
                    "asdada",
                  ),
                  /* 还款利息 */
                  buildListTile(
                    "还款利息 ",
                    "asdada",
                  ),
                  /* 还款利息 */
                  buildListTile(
                    "还款利息 ",
                    "asdada",
                  ),
                  /* 处理FOO */
                  buildListTile(
                    "处理FOO",
                    "asdada",
                  ),
                  /* 迟交还款费用 */
                  buildListTile(
                    "迟交还款费用",
                    "asdada",
                  ),
                ],
              ),
            ),

            /*   BUILD TIME LINE  */

            buildTimeline(),
          ],
        ),
      ),
    );
  }
}
